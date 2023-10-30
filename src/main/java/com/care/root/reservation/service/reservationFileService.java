package com.care.root.reservation.service;

import org.springframework.web.multipart.MultipartFile;

public interface reservationFileService {
	public String IMAGE_REPO="C:\\spring\\image_repo"; // C:/spring/image_repo
	public String getMessage(String msg, String url);
	public String saveFile(MultipartFile file);
}
