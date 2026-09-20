package com.group8.wallet.models;

import java.math.BigDecimal;
import java.util.Date;

public record Movimiento(TipoMovimiento tipo, BigDecimal monto, Date fecha) {
    public Movimiento(TipoMovimiento tipo, BigDecimal monto) {
        this(tipo, monto, new Date());
    }
}
