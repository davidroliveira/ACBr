package jACBrFramework.Test;

import jACBrFramework.ibge.ACBrIBGE;
import jACBrFramework.ibge.ACBrIBGECidade;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Testes basicos para ACBrIBGE.
 *
 * @author Willian Resplandes Matias
 * @version Criado em: 24/01/2017 
 */
public class ProgramTestIBGE {

    public static void main(String[] args) {
        try {
            final ACBrIBGE ibge = new ACBrIBGE();
            ibge.BuscarPorCodigo(5106422);
            ACBrIBGECidade[] cidades = ibge.getCidades();
            System.out.println(cidades[0].getMunicipio());


        } catch (Exception ex) {
            Logger.getLogger(ProgramTestIBGE.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
