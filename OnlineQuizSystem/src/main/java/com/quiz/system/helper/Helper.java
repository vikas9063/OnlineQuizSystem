package com.quiz.system.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.Part;

public class Helper {

	public boolean saveFile(Part file, String fileName, String path) throws Exception {

		boolean f = false;
		InputStream is = file.getInputStream();

		byte[] b = new byte[is.available()];
		is.read(b);

		FileOutputStream fileOutputStream = new FileOutputStream(path + fileName);
		fileOutputStream.write(b);
		System.out.println("Saved Successfully ");

		fileOutputStream.flush();
		fileOutputStream.close();

		f = true;
		return f;
	}

	public boolean deleteFile(String path) {
		boolean f = false;
		try {

			File file = new File(path);
			file.delete();
			f = true;

		} catch (Exception e) {
			// TODO: handle exception
		}

		return f;
	}
}
