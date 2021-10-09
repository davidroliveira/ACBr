/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jACBrFramework.ibge;

/**
 *
 * @author willian.matias
 */
public class ACBrIBGECidade {

    private String Municipio;
    private int CodMunicio;
    private String UF;
    private int CodUF;
    private double Area;

    public String getMunicipio() {
        return Municipio;
    }

    public void setMunicipio(String Municipio) {
        this.Municipio = Municipio;
    }

    public int getCodMunicio() {
        return CodMunicio;
    }

    public void setCodMunicio(int CodMunicio) {
        this.CodMunicio = CodMunicio;
    }

    public String getUF() {
        return UF;
    }

    public void setUF(String UF) {
        this.UF = UF;
    }

    public int getCodUF() {
        return CodUF;
    }

    public void setCodUF(int CodUF) {
        this.CodUF = CodUF;
    }

    public double getArea() {
        return Area;
    }

    public void setArea(double Area) {
        this.Area = Area;
    }

    @Override
    public String toString() {
        return ", UF=" + UF;
    }

    
}
