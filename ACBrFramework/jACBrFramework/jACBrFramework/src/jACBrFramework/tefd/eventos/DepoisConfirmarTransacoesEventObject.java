package jACBrFramework.tefd.eventos;

import jACBrFramework.tefd.RespostasPendentes;
import java.util.EventObject;

/**
 * Evento acionado apos confirmar a transacao.
 * 
 * @author Jose Mauro
 * @version Criado em: 06/03/2014 14:20:14, revisao: $Id: DepoisConfirmarTransacoesEventObject.java 6436 2014-03-07 12:41:31Z jmsandy $
 */
public class DepoisConfirmarTransacoesEventObject extends EventObject {    
    
    // <editor-fold defaultstate="collapsed" desc="Constants">
    private static final long serialVersionUID = 9015600365622049763L;
    // </editor-fold>    
    // <editor-fold defaultstate="collapsed" desc="Attributes">
    /**
     * Retorno da ECF.
     */
    private RespostasPendentes respostasPendentes;
    // </editor-fold>    
    //<editor-fold defaultstate="collapsed" desc="Constructor">
    public DepoisConfirmarTransacoesEventObject(Object pSource, RespostasPendentes pRespostasPendentes) {
        super(pSource);
        this.respostasPendentes = pRespostasPendentes;
    }
    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Getters - Setters">    
    /**
     * Retorno da ECF.
     * @return the respostasPendentes
     */
    public RespostasPendentes getRespostasPendentes() {
        return respostasPendentes;
    }
    // </editor-fold>    

}