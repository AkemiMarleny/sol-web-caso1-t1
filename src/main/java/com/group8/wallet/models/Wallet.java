package com.group8.wallet.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Wallet {

    private static Wallet instance = null;

    private BigDecimal saldo;
    private final List<Movimiento> movimientos;

    // singleton
    private Wallet() {
        this.saldo = new BigDecimal(0.0);
        this.movimientos = new ArrayList<>();
    }

    public static Wallet getInstance() {
        if (instance == null) {
            instance = new Wallet();
        }

        return instance;
    }

    public void registrarMovimiento(TipoMovimiento tipoMovimiento, BigDecimal monto) {
        if (tipoMovimiento == TipoMovimiento.RECARGA) {
            this.saldo = this.saldo.add(monto);
        } else {
            this.saldo = this.saldo.subtract(monto);
        }

        this.movimientos.add(0, new Movimiento(tipoMovimiento, monto));
    }

    public BigDecimal getSaldo() {
        return saldo;
    }

    public List<Movimiento> getMovimientos() {
        return Collections.unmodifiableList(movimientos);
    }
}
