package jACBrFramework.paf;

import java.util.Date;

/**
 * Detalhes da Nota fiscal emitida pelo PAF e nota fiscal emitida manualmente
 * @author Geovani de Paula
 * @version Criado em: 02/03/2018 09:10:00, revisao: $Id$
 */
public final class ACBrPAFRegistroJ2 {
    
    // <editor-fold defaultstate="collapsed" desc="Attributes">    
    private String cnpj;
    private Date   dataEmissao;
    private String numeroItem;
    private String codigoProduto;
    private String descricao;
    private double quantidade;
    private String unidade;
    private double valorUnitario;
    private double descontoItem;
    private double acrescimoItem;
    private double valorLiquido;
    private String totalizadorParcial;
    private String casasDecimaisValQtde;
    private String casasDecimaisValUnit;
    private String numeroNota;
    private String serieNota;
    private String chaveNf;
    private String tipoDoc;
    private boolean RegistroValido;
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

    public String getNumeroItem() {
        return numeroItem;
    }

    public void setNumeroItem(String numeroItem) {
        this.numeroItem = numeroItem;
    }

    public String getCodigoProduto() {
        return codigoProduto;
    }

    public void setCodigoProduto(String codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(double quantidade) {
        this.quantidade = quantidade;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }

    public double getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(double valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public double getDescontoItem() {
        return descontoItem;
    }

    public void setDescontoItem(double descontoItem) {
        this.descontoItem = descontoItem;
    }

    public double getAcrescimoItem() {
        return acrescimoItem;
    }

    public void setAcrescimoItem(double acrescimoItem) {
        this.acrescimoItem = acrescimoItem;
    }

    public double getValorLiquido() {
        return valorLiquido;
    }

    public void setValorLiquido(double valorLiquido) {
        this.valorLiquido = valorLiquido;
    }

    public String getTotalizadorParcial() {
        return totalizadorParcial;
    }

    public void setTotalizadorParcial(String totalizadorParcial) {
        this.totalizadorParcial = totalizadorParcial;
    }

    public String getCasasDecimaisValQtde() {
        return casasDecimaisValQtde;
    }

    public void setCasasDecimaisValQtde(String casasDecimaisValQtde) {
        this.casasDecimaisValQtde = casasDecimaisValQtde;
    }

    public String getCasasDecimaisValUnit() {
        return casasDecimaisValUnit;
    }

    public void setCasasDecimaisValUnit(String casasDecimaisValUnit) {
        this.casasDecimaisValUnit = casasDecimaisValUnit;
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
    // </editor-fold>
    
}
