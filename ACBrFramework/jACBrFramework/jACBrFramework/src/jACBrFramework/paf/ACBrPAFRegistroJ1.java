package jACBrFramework.paf;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

/**
 * Nota fiscal emitida pelo PAF e nota fiscal emitida manualmente
 * @author Geovani de Paula
 * @version Criado em: 02/03/2018 09:00:00, revisao: $Id$
 */
public final class ACBrPAFRegistroJ1 {
    
    // <editor-fold defaultstate="collapsed" desc="Attributes">    
    private String cnpj;
    private Date dataEmissao;
    private double subTotal;
    private double descSubTotal;
    private String indicadorDesc;
    private double acresSubTotal;
    private String indicadorAcres;
    private double valorLiquido;
    private String indicadorCanc;
    private double valCancAcres;
    private String ordemAplicDesAcres;
    private String nomeCliente;
    private String cpfCnpjCliente;
    private String numeroNota;
    private String serieNota;
    private String chaveNf;
    private String tipoDoc;
    private boolean RegistroValido;
    /**
     * Registro J2.
     */
    private Collection<ACBrPAFRegistroJ2> registrosJ2 = new ArrayList<ACBrPAFRegistroJ2>();    
    
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Getters - Setters">
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public Date getDataEmissao() {
        return dataEmissao;
    }

    public void setDataEmissao(Date dataEmissao) {
        this.dataEmissao = dataEmissao;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getDescSubTotal() {
        return descSubTotal;
    }

    public void setDescSubTotal(double descSubTotal) {
        this.descSubTotal = descSubTotal;
    }

    public String getIndicadorDesc() {
        return indicadorDesc;
    }

    public void setIndicadorDesc(String indicadorDesc) {
        this.indicadorDesc = indicadorDesc;
    }

    public double getAcresSubTotal() {
        return acresSubTotal;
    }

    public void setAcresSubTotal(double acresSubTotal) {
        this.acresSubTotal = acresSubTotal;
    }

    public String getIndicadorAcres() {
        return indicadorAcres;
    }

    public void setIndicadorAcres(String indicadorAcres) {
        this.indicadorAcres = indicadorAcres;
    }

    public double getValorLiquido() {
        return valorLiquido;
    }

    public void setValorLiquido(double valorLiquido) {
        this.valorLiquido = valorLiquido;
    }

    public String getIndicadorCanc() {
        return indicadorCanc;
    }

    public void setIndicadorCanc(String indicadorCanc) {
        this.indicadorCanc = indicadorCanc;
    }

    public double getValCancAcres() {
        return valCancAcres;
    }

    public void setValCancAcres(double valCancAcres) {
        this.valCancAcres = valCancAcres;
    }

    public String getOrdemAplicDesAcres() {
        return ordemAplicDesAcres;
    }

    public void setOrdemAplicDesAcres(String ordemAplicDesAcres) {
        this.ordemAplicDesAcres = ordemAplicDesAcres;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getCpfCnpjCliente() {
        return cpfCnpjCliente;
    }

    public void setCpfCnpjCliente(String cpfCnpjCliente) {
        this.cpfCnpjCliente = cpfCnpjCliente;
    }

    public String getNumeroNota() {
        return numeroNota;
    }

    public void setNumeroNota(String numeroNota) {
        this.numeroNota = numeroNota;
    }

    public String getSerieNota() {
        return serieNota;
    }

    public void setSerieNota(String serieNota) {
        this.serieNota = serieNota;
    }

    public String getChaveNf() {
        return chaveNf;
    }

    public void setChaveNf(String chaveNf) {
        this.chaveNf = chaveNf;
    }

    public String getTipoDoc() {
        return tipoDoc;
    }

    public void setTipoDoc(String tipoDoc) {
        this.tipoDoc = tipoDoc;
    }

    public boolean isRegistroValido() {
        return RegistroValido;
    }

    public void setRegistroValido(boolean RegistroValido) {
        this.RegistroValido = RegistroValido;
    }
    
    public Collection<ACBrPAFRegistroJ2> getRegistrosJ2() {
        return registrosJ2;
    }

    public void setRegistrosJ2(Collection<ACBrPAFRegistroJ2> registrosJ2) {
        this.registrosJ2 = registrosJ2;
    }
    // </editor-fold>
}
