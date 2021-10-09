/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jACBrFramework.ibge;

import com.sun.jna.ptr.IntByReference;
import jACBrFramework.ACBrClass;
import jACBrFramework.ACBrEventListener;
import jACBrFramework.ACBrException;
import jACBrFramework.interop.ACBrIBGEInterop;
import jACBrFramework.interop.ACBrIBGEInterop.CidadeRec;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;


public class ACBrIBGE extends ACBrClass {

    private ACBrIBGECidade[] cidades;


    public ACBrIBGE() throws ACBrException {

    }

    /**
     * Cria um novo objeto com base no charset recebido.
     *
     * @param pCharset charset utilizado na conversao para geracao do sintegra.
     */
    public ACBrIBGE(Charset pCharset) throws ACBrException {
        this();
        setCustomCharset(pCharset);
    }

    public void BuscarPorCodigo(int codigo) throws ACBrException {
        cidades = null;
        int ret = ACBrIBGEInterop.INSTANCE.IBGE_BuscarPorCodigo(getHandle(), codigo);
        checkResult(ret);
    }

    public void BuscarPorNome(String nome, String uf, Boolean exata) throws ACBrException {
        cidades = null;
        int ret = ACBrIBGEInterop.INSTANCE.IBGE_BuscarPorNome(getHandle(), nome, uf, exata);
        checkResult(ret);
    }

    private void CarregaCidades() throws ACBrException {
        int count = ACBrIBGEInterop.INSTANCE.IBGE_Cidades_GetCount(getHandle());
        checkResult(count);
        cidades = new ACBrIBGECidade[count];
        for (int i = 0; i < count; i++) {
            CidadeRec.ByReference cidadeRec = new ACBrIBGEInterop.CidadeRec.ByReference();
            int ret = ACBrIBGEInterop.INSTANCE.IBGE_Cidades_GetItem(getHandle(), cidadeRec, i);
            checkResult(ret);

            ACBrIBGECidade cidade = new ACBrIBGECidade();
            
            cidade.setMunicipio(fromUTF8(cidadeRec.Municipio));
            cidade.setCodMunicio(cidadeRec.CodMunicio);
            cidade.setUF(fromUTF8(cidadeRec.UF));
            cidade.setCodUF(cidadeRec.CodUF);
            cidade.setArea(cidadeRec.Area);
            cidades[i] = cidade;

        }
    }

    @Override
    protected void onInitialize() throws ACBrException {
        IntByReference handle = new IntByReference();
        int ret = ACBrIBGEInterop.INSTANCE.IBGE_Create(handle);
        checkResult(ret);
        setHandle(handle.getValue());
    }

    /**
     * Finaliza a comunicacao com a acbr.
     *
     * @throws ACBrException excecao acionada ao finalizar a comunicacao.
     */
    @Override
    protected void onFinalize() throws ACBrException {
        if (getHandle() != 0) {
            int ret = ACBrIBGEInterop.INSTANCE.IBGE_Destroy(getHandle());
            checkResult(ret);
            setHandle(0);
        }
    }

    public void addOnBuscaEfetuada(ACBrEventListener<BuscaEfetuadaEventObject> pListener) {
        if (!hasListeners("onBuscaEfetuada")) {
            ACBrIBGEInterop.INSTANCE.IBGE_SetOnBuscaEfetuada(getHandle(), new ACBrIBGEInterop.OnBuscaEfetuadaCallback() {
                @Override
                public void invoke() {
                    onBuscaEfetuada();
                }
            });
        }

        //addListener("onLePeso", pListener);
    }

    /**
     * Remove o listener associado.
     *
     * @param pListener
     */
    public void removeOnBuscaEfetuada(ACBrEventListener<BuscaEfetuadaEventObject> pListener) {
        removeListener("onBuscaEfetuada", pListener);
        if (!hasListeners("onBuscaEfetuada")) {
            ACBrIBGEInterop.INSTANCE.IBGE_SetOnBuscaEfetuada(getHandle(), null);
        }
    }

    /**
     * Leitura o codigo de barras.
     *
     * @return
     */
    public void onBuscaEfetuada() {
        BuscaEfetuadaEventObject e = new BuscaEfetuadaEventObject(this);
        notifyListeners("onBuscaEfetuada", e);
    }

    @Override
    public void checkResult(int pResult) throws ACBrException, IndexOutOfBoundsException {
        switch (pResult) {
            case -1: {
                String lMessage;
                final int LEN = 1024;
                ByteBuffer buffer = ByteBuffer.allocate(LEN);
                int ret = ACBrIBGEInterop.INSTANCE.IBGE_GetUltimoErro(getHandle(), buffer, LEN);
                lMessage = fromUTF8(buffer, ret);
                throw new ACBrException(lMessage);
            }
            case -2: {
                throw new ACBrException("ACBr IBGE não inicializado.");
            }
            case -3: {
                throw new IndexOutOfBoundsException();
            }
        }
    }

    public ACBrIBGECidade[] getCidades() {
        if (cidades == null) {
            try {
                CarregaCidades();
            } catch (ACBrException ex) {
                ex.printStackTrace();
            }
        }
        return cidades;
    }

    public void setCidades(ACBrIBGECidade[] cidades) {
        this.cidades = cidades;
    }

}
