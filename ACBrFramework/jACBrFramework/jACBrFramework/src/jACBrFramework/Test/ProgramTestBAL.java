package jACBrFramework.Test;

import jACBrFramework.ACBrEventListener;
import jACBrFramework.bal.ACBrBAL;
import jACBrFramework.bal.ACBrBALModelo;
import jACBrFramework.bal.LePesoEventObject;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Testes basicos para leitura serial.
 *
 * @author Jose Mauro
 * @version Criado em: 26/05/2014 16:37:35, revisao: $Id: ProgramTestLCB_1.java
 * 6912 2014-05-26 20:07:28Z jmsandy $
 */
public class ProgramTestBAL {

    public static void main(String[] args) {
        try {
            final ACBrBAL bal = new ACBrBAL();
            System.out.println("Configurando a PORTA");
            bal.setPorta("COM3");
            System.out.println("Configurando o MODELO");
            bal.setModelo(ACBrBALModelo.Toledo);
            System.out.println("Ativando o componente.");
            bal.ativar();
            System.out.println("Peso atual da balança : "+bal.lerPeso(2000));

            bal.addOnLePeso(new ACBrEventListener<LePesoEventObject>() {
                @Override
                public void notification(LePesoEventObject e) {
                    try {
                        System.out.print("Recuperando o último peso: ");
                        System.out.println(bal.getUltimoPesoLido());
                    } catch (Exception ex) {
                        Logger.getLogger(ProgramTestAac.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            });
            

            System.out.print("Pressione alguma tecla para finalizar a leitura.");
            System.in.read();

            System.out.println("Desativando o componente.");
            bal.desativar();
        } catch (Exception ex) {
            Logger.getLogger(ProgramTestAac.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
