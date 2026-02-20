package com.example.model;



import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String username;
    private String password;
    private String email;
    private String fullName;

    // Constructor
    public User(String username, String password, String email, String fullName) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
    }

    // Getters and Setters
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    // Convert to string for file storage
    public String toFileString() {
        return username + "," + password + "," + email + "," + fullName;
    }

    // Create User from file string
    public static User fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 4) {
            return new User(parts[0], parts[1], parts[2], parts[3]);
        }
        return null;
    }
}
