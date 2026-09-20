<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Billetera Digital</title>
                <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
            </head>

            <body class="bg-slate-50">
                <main class="w-md max-w-md mx-auto flex flex-col py-1.5 gap-y-1.5">
                    <h1 class="text-lg text-slate-900 text-center font-bold">Billetera Digital</h1>

                    <div class="flex flex-col rounded-md border border-slate-200 px-3 py-3 bg-white">
                        <div class="text-xs text-slate-500">Saldo disponible</div>
                        <div class="text-base font-bold text-slate-700">S/
                            <fmt:formatNumber value="${billetera.saldo}" pattern="#,##0.00" />
                        </div>
                    </div>
                </main>
            </body>

            </html>