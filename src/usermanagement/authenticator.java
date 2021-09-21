package usermanagement;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import databasepackage.database;

public class authenticator {
	private static String hashgenerator(String password) throws NoSuchAlgorithmException{
        MessageDigest mg=MessageDigest.getInstance("SHA-256");
        byte[] hashobj=mg.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hashobj);        
    }	
	public static boolean authenticate(String password,String hash){
        try{
            if(hashgenerator(password).equals(hash)){
                return true;
            }
            return false;            
        }
        catch(NoSuchAlgorithmException ex){
            return false;
        }
    }
}
