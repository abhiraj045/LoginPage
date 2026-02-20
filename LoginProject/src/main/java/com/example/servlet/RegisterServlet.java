package com.example.servlet;

import com.example.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String USERS_FILE = "/users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get form data
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email").trim();
        String fullName = request.getParameter("fullName").trim();

        // 2. Validation
        if (username.isEmpty() || password.isEmpty() || email.isEmpty() || fullName.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required!");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("fullName", fullName);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("fullName", fullName);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (password.length() < 6) {
            request.setAttribute("errorMessage", "Password must be at least 6 characters!");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("fullName", fullName);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // 3. Check if username already exists
        List<String> allUsers = readUsersFromFile();
        for (String line : allUsers) {
            User existingUser = User.fromFileString(line);
            if (existingUser != null && existingUser.getUsername().equals(username)) {
                request.setAttribute("errorMessage", "Username already exists!");
                request.setAttribute("username", username);
                request.setAttribute("email", email);
                request.setAttribute("fullName", fullName);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;	
            }
        }

        // 4. Save new user
        User newUser = new User(username, password, email, fullName);
        saveUserToFile(newUser);

        // 5. Redirect to login with success message
        response.sendRedirect("login.jsp?registered=true");
    }

    // Read all users from file
    private List<String> readUsersFromFile() {
        List<String> users = new ArrayList<>();
        String filePath = getServletContext().getRealPath(USERS_FILE);
        
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                users.add(line);
            }
        } catch (FileNotFoundException e) {
            // File doesn't exist yet - that's ok
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    // Save user to file
    private void saveUserToFile(User user) {
        String filePath = getServletContext().getRealPath(USERS_FILE);
        
        try (FileWriter fw = new FileWriter(filePath, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {
            out.println(user.toFileString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}