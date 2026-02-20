package com.example.servlet;

import com.example.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
//    private static final String USERS_FILE = "/users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Check credentials against file
        if (validateUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Validate user against file
    private boolean validateUser(String username, String password) {
        List<String> allUsers = readUsersFromFile();
        
        for (String line : allUsers) {
            User user = User.fromFileString(line);
            if (user != null && user.getUsername().equals(username) 
                && user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

 // Replace readUsersFromFile() method
    private List<String> readUsersFromFile() {
        List<String> users = new ArrayList<>();
        String filePath = getFilePath();  // <-- CHANGE THIS
        
        File file = new File(filePath);
        if (!file.exists()) {
            return users;
        }
        
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                users.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    // ADD this method
    private String getFilePath() {
        String path = getServletContext().getRealPath("/WEB-INF/users.txt");
        File file = new File(path);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return path;
    }
}