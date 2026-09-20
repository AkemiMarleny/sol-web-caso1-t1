package com.group8.wallet.models;

import java.math.BigDecimal;
import java.util.Date;

public class Movimiento {
    private final TipoMovimiento tipo;
    private final BigDecimal monto;
    private final Date fecha;

    public Movimiento(TipoMovimiento tipo, BigDecimal monto) {
        this.tipo = tipo;
        this.monto = monto;
        this.fecha = new Date();
    }

    public TipoMovimiento getTipo() {
        return tipo;
    }

    public BigDecimal getMonto() {
        return monto;
    }

    public Date getFecha() {
        return fecha;
    }

    public boolean isRecarga() {
        return tipo == TipoMovimiento.RECARGA;
    }
}
