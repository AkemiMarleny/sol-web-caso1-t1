package com.group8.wallet;

import java.io.IOException;

import com.group8.wallet.services.Wallet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dashboard")
public class WalletServlet extends HttpServlet {

    private static final String ATTR_WALLET = "billetera";

    public WalletServlet() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setAttribute(ATTR_WALLET, Wallet.getInstance());
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
                .forward(request, response);
    }
}
