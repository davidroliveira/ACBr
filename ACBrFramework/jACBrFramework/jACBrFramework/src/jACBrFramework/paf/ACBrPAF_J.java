package jACBrFramework.paf;

import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author Geovani de Paula
 * @version Criado em: 01/03/2018 09:20:02, revisao: $Id$
 */
public final class ACBrPAF_J {

    // <editor-fold defaultstate="collapsed" desc="Enums">
    /**
     * Tipo de registro que sofrera contagem.
     */
    private enum TipoRegistro { J1, J2 }
    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Attributes">
    /**
     * Tipo de registro que sofrera contagem.
     */
    /**
     * Registro J1.
     */
    private Collection<ACBrPAFRegistroJ1> registrosJ1 = new ArrayList<ACBrPAFRegistroJ1>();
    
    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Methods">
    /**
     * Realiza a limpeza dos registros associado ao bloco.
     */
    public void limparRegistros() {
        getRegistrosJ1().clear();
    } 
    
    /**
     * Totaliza o numero de registros J2.
     * @return 
     */
    public int countJ2() {
        int lCount = 0;
        
        for (ACBrPAFRegistroJ1 lRegistroJ1 : getRegistrosJ1()) {
            lCount += lRegistroJ1.getRegistrosJ2().size();
        }
        
        return lCount;
    }
    
    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Getters - Setters">    
    
    /**
     * Registro J1.
     * @return the registrosJ1
     */
    public Collection<ACBrPAFRegistroJ1> getRegistrosJ1() {
        return registrosJ1;
    }
    // </editor-fold>     
}