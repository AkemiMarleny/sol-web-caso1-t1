package com.group8.wallet;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

import com.group8.wallet.models.TipoMovimiento;
import com.group8.wallet.services.Wallet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dashboard")
public class WalletServlet extends HttpServlet {

    private static final String ATTR_WALLET = "billetera";
    private static final String ATTR_ERROR = "errorMessage";

    public WalletServlet() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setAttribute(ATTR_WALLET, Wallet.getInstance());
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Wallet wallet = Wallet.getInstance();
        BigDecimal monto = parsearMonto(request, response);
        if (monto == null) {
            return;
        }

        if (monto.compareTo(BigDecimal.ZERO) <= 0) {
            renderError(request, response, "El monto debe ser mayor a cero.");
            return;
        }

        String tipoMovimientoRaw = request.getParameter("tipo");
        boolean esUnGasto = tipoMovimientoRaw.equalsIgnoreCase("G");
        if (esUnGasto && monto.compareTo(wallet.getSaldo()) > 0) {
            renderError(request, response, "El gasto no puede superar el saldo disponible");
            return;
        }

        TipoMovimiento tipo = esUnGasto ? TipoMovimiento.GASTO : TipoMovimiento.RECARGA;
        wallet.registrarMovimiento(tipo, monto);

        request.setAttribute(ATTR_WALLET, wallet);
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
                .forward(request, response);
    }

    private BigDecimal parsearMonto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String montoRaw = request.getParameter("monto");
            return new BigDecimal(montoRaw).setScale(2, RoundingMode.HALF_UP);
        } catch (NumberFormatException | NullPointerException ex) {
            renderError(request, response, "Ingresa monto válido");
            return null;
        }
    }

    private void renderError(HttpServletRequest request, HttpServletResponse response, String mensaje)
            throws ServletException, IOException {
        request.setAttribute(ATTR_ERROR, mensaje);
        request.setAttribute(ATTR_WALLET, Wallet.getInstance());
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
                .forward(request, response);
    }

}
