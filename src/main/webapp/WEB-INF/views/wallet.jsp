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
                <main class="w-2xl max-w-2xl mx-auto flex flex-col py-1.5 gap-y-1.5">
                    <h1 class="text-lg text-slate-900 text-center font-bold">Billetera Digital</h1>

                    <div class="flex flex-col rounded-md border border-slate-200 px-3 py-3 bg-white">
                        <div class="text-sm text-slate-500">Saldo disponible</div>
                        <div class="text-base font-bold text-slate-700">S/
                            <fmt:formatNumber value="${billetera.saldo}" pattern="#,##0.00" />
                        </div>
                    </div>

                    <div class="flex flex-col rounded-md border border-slate-200 px-3 py-3 gap-y-3 bg-white">
                        <div class="text-sm text-slate-900">
                            Registrar movimiento
                        </div>
                        <div class="flex flex-col">
                            <form class="flex flex-col gap-y-3" method="post"
                                action="${pageContext.request.contextPath}/wallet">
                                <div class="flex flex-row gap-x-3">
                                    <div class="flex flex-col gap-y-2 w-full">
                                        <label class="text-sm text-slate-500" for="monto">Monto</label>
                                        <input
                                            class="rounded-md border border-slate-200 text-base text-slate-500 py-1 px-1"
                                            type="number" id="monto" name="monto" step="0.1" min="0.1" required />
                                    </div>

                                    <div class="flex flex-col gap-y-2 w-full">
                                        <label class="text-sm text-slate-500" for="tipo">Tipo</label>
                                        <select
                                            class="w-full appearance-none rounded-md border border border-slate-200 text-base text-slate-500 py-1 px-1"
                                            id="tipo" name="tipo">
                                            <option value="R">Recarga</option>
                                            <option value="G">Gasto</option>
                                        </select>
                                    </div>
                                </div>


                                <c:if test="${not empty errorMessage}">
                                    <div
                                        class="flex flex-row border border-rose-200 rounded-md px-1.5 py-1.5 items-center gap-x-1">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                stroke-width="1.5" stroke="currentColor" class="size-6 text-rose-600">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
                                            </svg>
                                        </div>
                                        <p class="text-sm text-rose-600">${errorMessage}</p>
                                    </div>
                                </c:if>


                                <button
                                    class="bg-blue-500 text-white text-sm w-auto px-1 py-1 hover:bg-blue-800 rounded-md"
                                    type="submit">
                                    Registrar
                                </button>
                            </form>
                        </div>
                    </div>

                    <div class="flex flex-col rounded-md border border-slate-200 px-3 py-3 gap-y-3 bg-white">
                        <div class="text-sm text-slate-900">
                            Movimientos históricos
                        </div>
                        <div>
                            <c:choose>
                                <c:when test="${empty billetera.movimientos}">
                                    <p class="text-base text-slate-500">Aún no hay movimientos registrados.</p>
                                </c:when>
                                <c:otherwise>
                                    <ul class="flex flex-col space-y-2">
                                        <c:forEach items="${billetera.movimientos}" var="movimiento">
                                            <li class="flex flex-row justify-between gap-x-1 items-center">
                                                <div class="flex flex-col gap-x-1">
                                                    <span
                                                        class="${movimiento.recarga ? 'text-green-700' : 'text-rose-700'} text-sm font-semibold">
                                                        ${movimiento.recarga ? 'RECARGA' : 'GASTO'}
                                                    </span>

                                                    <span class="text-xs text-slate-500">
                                                        <fmt:formatDate value="${movimiento.fecha}"
                                                            pattern="dd/MM/yyyy HH:mm" />
                                                    </span>
                                                </div>
                                                <span
                                                    class="${movimiento.recarga ? 'text-green-700' : 'text-rose-700'} text-base font-bold">
                                                    ${movimiento.recarga ? '+' : '-'}
                                                    S/.
                                                    <fmt:formatNumber value="${movimiento.monto}" pattern="#,##0.00" />
                                                </span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </main>
            </body>

            </html>