package study.spring.mysite.controller.bbs;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import study.spring.helper.FileInfo;
import study.spring.helper.RegexHelper;
import study.spring.helper.UploadHelper;
import study.spring.helper.WebHelper;
import study.spring.mysite.controller.Download;
import study.spring.mysite.model.BbsDocument;
import study.spring.mysite.model.BbsFile;
import study.spring.mysite.model.Member;
import study.spring.mysite.service.BbsDocumentService;
import study.spring.mysite.service.BbsFileService;

@Controller
public class DocumentEditOk {
	/** (1) ����ϰ��� �ϴ� Helper ��ü ���� */
	// --> import org.apache.logging.log4j.Logger;
	private static Logger logger = LoggerFactory.getLogger(Download.class);
	@Autowired
	SqlSession sqlSession;
	@Autowired
	WebHelper web;
	@Autowired
	BBSCommon bbs;
	@Autowired
	UploadHelper upload;
	@Autowired
	RegexHelper regex;
	@Autowired
	BbsDocumentService bbsDocumentService;
	@Autowired
	BbsFileService bbsFileService;

	@RequestMapping(value = "/bbs/document_edit_ok.do")
	public ModelAndView doRun(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
	
		web.init();

		/** (3) ������ ���Ե� POST �Ķ���� �ޱ� */
		try {
			upload.multipartRequest();
		} catch (Exception e) {
			return web.redirect(null, "multipart �����Ͱ� �ƴմϴ�.");
		}

		/** (4) UploadHelper���� �ؽ�Ʈ ������ ���� ���� */
		Map<String, String> paramMap = upload.getParamMap();

		// �� ��ȣ �������� --> Map���� �������� ���� ��� String�̹Ƿ� ����ȯ �ʿ�
		int documentId = 0;
		try {
			documentId = Integer.parseInt(paramMap.get("document_id"));
		} catch (NumberFormatException e) {
			return web.redirect(null, "�� ��ȣ�� �ùٸ��� �ʽ��ϴ�.");
		}

		String category = paramMap.get("category");
		String writerName = paramMap.get("writer_name");
		String writerPw = paramMap.get("writer_pw");
		String email = paramMap.get("email");
		String subject = paramMap.get("subject");
		String content = paramMap.get("content");
		// �ۼ��� ������ �ּ� ��������
		String ipAddress = web.getClientIP();
		// ȸ�� �Ϸù�ȣ --> �� �α����� ��� 0
		int memberId = 0;

		/** (5) �Խ��� ī�װ� ���� �޾Ƽ� View�� ���� */
		// ������ ÷�ε� ��� WebHelper�� ����� �� ����.
		// String category = web.getString("category");
		model.addAttribute("category", category);

		/** (6) �����ϴ� �Խ������� �Ǻ��ϱ� */
		try {
			String bbsName = bbs.getBbsName(category);
			model.addAttribute("bbsName", bbsName);
		} catch (Exception e) {
			return web.redirect(null, e.getLocalizedMessage());
		}

		/** (7) �α��� �� ��� �ڽ��� ���̶�� �Է����� ���� ������ ���� �����ͷ� ��ü�Ѵ�. */
		// ������ �˻� ����
		boolean myDocument = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			try {
				// ������ ������ ���Ͽ� ����ϴ� �ӽ� ��ü
				BbsDocument temp = new BbsDocument();
				temp.setCategory(category);
				temp.setId(documentId);
				temp.setMemberId(loginInfo.getId());

				if (bbsDocumentService.selectDocumentCountByMemberId(temp) > 0) {
					// �������� �ǹ��ϴ� ���� ����
					myDocument = true;
					// �Էµ��� ���� ������ ����
					writerName = loginInfo.getName();
					email = loginInfo.getEmail();
					writerPw = loginInfo.getUserPw();
					memberId = loginInfo.getId();
				}
			} catch (Exception e) {
				return web.redirect(null, e.getLocalizedMessage());
			}
		}

		// ���޵� �Ķ���ʹ� �α׷� Ȯ���Ѵ�.
		logger.debug("documentId=" + documentId);
		logger.debug("category=" + category);
		logger.debug("writer_name=" + writerName);
		logger.debug("writer_pw=" + writerPw);
		logger.debug("email=" + email);
		logger.debug("subject=" + subject);
		logger.debug("content=" + content);
		logger.debug("ipAddress=" + ipAddress);
		logger.debug("memberId=" + memberId);

		/** (8) �Է� ���� �Ķ���Ϳ� ���� ��ȿ�� �˻� */
		// �̸� + ��й�ȣ
		if (!regex.isValue(writerName)) {
			return web.redirect(null, "�ۼ��� �̸��� �Է��ϼ���.");
		}

		if (!regex.isValue(writerPw)) {
			return web.redirect(null, "��й�ȣ�� �Է��ϼ���.");
		}

		// �̸���
		if (!regex.isValue(email)) {
			return web.redirect(null, "�̸����� �Է��ϼ���.");
		}

		if (!regex.isEmail(email)) {
			return web.redirect(null, "�̸����� ������ �߸��Ǿ����ϴ�.");
		}

		// ���� �� ���� �˻�
		if (!regex.isValue(subject)) {
			return web.redirect(null, "�� ������ �Է��ϼ���.");
		}

		if (!regex.isValue(content)) {
			return web.redirect(null, "������ �Է��ϼ���.");
		}

		/** (9) �Է� ���� �Ķ���͸� Beans�� ���� */
		BbsDocument document = new BbsDocument();
		// UPDATE���� WHERE������ ����ؾ� �ϹǷ� �� ��ȣ �߰�
		// --> �� ��ȣ�� ���ڷ� ��ȯ�ؼ� ó���ؾ� �Ѵ�.
		document.setId(documentId);
		document.setCategory(category);
		document.setWriterName(writerName);
		document.setWriterPw(writerPw);
		document.setEmail(email);
		document.setSubject(subject);
		document.setContent(content);
		document.setIpAddress(ipAddress);
		document.setMemberId(memberId);
		logger.debug(document.toString());

		/** (10) �Խù� ������ ���� Service ����� ȣ�� */
		try {
			// �ڽ��� ���� �ƴ϶�� ��й�ȣ �˻縦 ���� �����Ѵ�.
			if (!myDocument) {
				bbsDocumentService.selectDocumentCountByPw(document);
			}
			bbsDocumentService.updateDocument(document);
		} catch (Exception e) {
			return web.redirect(null, e.getLocalizedMessage());
		}

		/** (11) ������ ������ ÷�����Ͽ� ���� ó�� */
		// ������ ���� ��Ͽ� ���� üũ��� --> üũ�ڽ��� ���ð��� paramMap���� ����
		String delFile = paramMap.get("del_file");

		if (delFile != null) {
			// �޸� ������ �߶� �迭�� ��ȯ
			String[] delFileList = delFile.split(",");
	
			for (int i = 0; i < delFileList.length; i++) {
				try {
					// üũ�ڽ��� ���ؼ� ���޵� id������ ���� ���Ͽ� ���� Beans ����
					BbsFile file = new BbsFile();
					file.setId(Integer.parseInt(delFileList[i]));
	
					// ���� ���Ͽ� ���� ������ ��ȸ�Ͽ� ���� ������ �����Ѵ�.
					BbsFile item = bbsFileService.selectFile(file);
					upload.removeFile(item.getFileDir() + "/" + item.getFileName());
	
					// DB���� �������� ����ó��
					bbsFileService.deleteFile(file);
				} catch (Exception e) {
					return web.redirect(null, e.getLocalizedMessage());
				}
			}
		}

		/** (12) �߰������� ���ε� �� ���� ���� ó�� */
		// ���ε� �� ���� ���
		List<FileInfo> fileInfoList = upload.getFileList();

		// ���ε� �� ������ �� ��ŭ �ݺ� ó�� �Ѵ�.
		for (int i = 0; i < fileInfoList.size(); i++) {
			// ���ε� �� ���� �ϳ� ����
			// --> ���ε� �� ������ �����ͺ��̽��� �����ϱ� ���� ���·� �����ؾ� �Ѵ�.
			FileInfo info = fileInfoList.get(i);

			// DB�� �����ϱ� ���� �׸� �ϳ� ����
			BbsFile file = new BbsFile();

			// ������ ����
			file.setOriginName(info.getOrginName());
			file.setFileDir(info.getFileDir());
			file.setFileName(info.getFileName());
			file.setContentType(info.getContentType());
			file.setFileSize(info.getFileSize());

			// ��� �Խù��� ���� �������� �ν��ؾ� �ϹǷ� �� ��ȣ �߰�
			file.setBbsDocumentId(documentId);

			// ����� �����͸� DB�� ����
			try {
				bbsFileService.insertFile(file);
			} catch (Exception e) {
				return web.redirect(null, e.getLocalizedMessage());
			}
		}
		

		String url = "%s/bbs/document_read.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), category, documentId);
		return web.redirect(url, null);
	}

}
