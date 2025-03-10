/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilities;

/**
 *
 * @author zeryus
 */
import com.cloudinary.*;

import com.cloudinary.utils.ObjectUtils;
import io.github.cdimascio.dotenv.Dotenv;
import java.io.File;
import java.io.IOException;

import java.util.Map;

public class CloudinaryUtils {

//    private static final String CLOUD_NAME = "diyupyilg";
//    private static final String API_KEY = "245387758415963";
//    private static final String API_SECRET = "jjvZ1ed5gQg_Cmb9iMZTRqdd2xI";


    private static final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
        "cloud_name", "diyupyilg",
        "api_key", "245387758415963",
            "api_secret", "jjvZ1ed5gQg_Cmb9iMZTRqdd2xI"));

    public static String uploadFile(File file) {
        try {
            Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
            return uploadResult.get("secure_url").toString();
        }catch (IOException e) {

            System.err.println(e);
            return null;
        }
    }
}
