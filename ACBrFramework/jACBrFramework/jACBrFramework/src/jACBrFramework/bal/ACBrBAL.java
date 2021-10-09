/*
 *Desenvolvido por Willian Resplandes Matias
 *willianresplandes@gmail.com
 *20/01/2017
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jACBrFramework.bal;

import com.sun.jna.ptr.DoubleByReference;
import com.sun.jna.ptr.IntByReference;
import jACBrFramework.ACBrClass;
import jACBrFramework.ACBrEventListener;
import jACBrFramework.ACBrException;
import jACBrFramework.interop.ACBrBALInterop;
import jACBrFramework.lcb.LeCodigoEventObject;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/**
 *
 * @author willian.matias
 */
public class ACBrBAL extends ACBrClass {

    //<editor-fold defaultstate="collapsed" desc="Attributes">
    // </editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Constructor">
    /**
     * Construtor padrao.
     *
     * @throws ACBrException excecao acionada ao construir o objeto.
     */
    public ACBrBAL() throws ACBrException {
    }

    /**
     * Cria um novo objeto com base no charset recebido.
     *
     * @param pCharset charset utilizado na conversao para geracao do sintegra.
     */
    public ACBrBAL(Charset pCharset) throws ACBrException {
        this();
        setCustomCharset(pCharset);
    }

    @Override
    protected void onInitialize() throws ACBrException {
        IntByReference handle = new IntByReference();
        int ret = ACBrBALInterop.INSTANCE.BAL_Create(handle);
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
            int ret = ACBrBALInterop.INSTANCE.BAL_Destroy(getHandle());
            checkResult(ret);
            setHandle(0);
        }
    }

    // </editor-fold>
    //<editor-fold defaultstate="collapsed" desc="Components Methods">
    /**
     * Verifica se o componente esta ativo.
     *
     * @return status do componente.
     * @throws ACBrException
     */
    public boolean isAtivo() throws ACBrException {
        return ACBrBALInterop.INSTANCE.BAL_GetAtivo(getHandle()) != 0;
    }

    public void ativar() throws ACBrException {
        int ret = ACBrBALInterop.INSTANCE.BAL_Ativar(getHandle());
        checkResult(ret);
    }

    /**
     * Realiza a ativacao do componente.
     *
     * @throws ACBrException
     */
    public void desativar() throws ACBrException {
        int ret = ACBrBALInterop.INSTANCE.BAL_Desativar(getHandle());
        checkResult(ret);
    }

    /**
     * Recupera a porta de comunicacao com o leitor serial
     *
     * @return
     * @throws ACBrException
     */
    public String getPorta() throws ACBrException {
        ByteBuffer lPorta = ByteBuffer.allocate(STR_BUFFER_LEN);
        int ret = ACBrBALInterop.INSTANCE.BAL_GetPorta(getHandle(), lPorta, STR_BUFFER_LEN);
        checkResult(ret);
        return fromUTF8(lPorta, ret);
    }

    /**
     * Seta a porta de comunicacao com o leitor serial.
     *
     * @param pPorta porta de comunicacao.
     * @throws ACBrException
     */
    public void setPorta(String pPorta) throws ACBrException {
        int ret = ACBrBALInterop.INSTANCE.BAL_SetPorta(getHandle(), toUTF8(pPorta));
        checkResult(ret);
    }

    public int getModelo() throws ACBrException {
        int ret = ACBrBALInterop.INSTANCE.BAL_GetModelo(getHandle());
        checkResult(ret);
        return ret;
    }

    public void setModelo(ACBrBALModelo modelo) throws ACBrException {
        int ret = ACBrBALInterop.INSTANCE.BAL_SetModelo(getHandle(), modelo.ordinal());
        checkResult(ret);
    }

    public String getModeloStr() throws ACBrException {
        ByteBuffer lPorta = ByteBuffer.allocate(STR_BUFFER_LEN);
        int ret = ACBrBALInterop.INSTANCE.BAL_GetModeloStr(getHandle(), lPorta, STR_BUFFER_LEN);
        checkResult(ret);
        return fromUTF8(lPorta, ret);
    }

    public String getUltimaResposta() throws ACBrException {
        ByteBuffer lPorta = ByteBuffer.allocate(STR_BUFFER_LEN);
        int ret = ACBrBALInterop.INSTANCE.BAL_GetUltimaResposta(getHandle(), lPorta, STR_BUFFER_LEN);
        checkResult(ret);
        return fromUTF8(lPorta, ret);
    }

    public double getUltimoPesoLido() throws ACBrException {
        DoubleByReference ultimoPesoLido = new DoubleByReference();
        int ret = ACBrBALInterop.INSTANCE.BAL_GetUltimoPesoLido(getHandle(), ultimoPesoLido);
        checkResult(ret);
        return ultimoPesoLido.getValue();
    }

    public double lerPeso(int timeout) throws ACBrException {
        DoubleByReference lPeso = new DoubleByReference();
        int ret = ACBrBALInterop.INSTANCE.BAL_LePeso(getHandle(), timeout, lPeso);
        checkResult(ret);
        return lPeso.getValue();
    }

    public void setMonitoraBalanca(Boolean monitorar) throws ACBrException {
        int ret = ACBrBALInterop.INSTANCE.BAL_SetMonitoraBalanca(getHandle(), monitorar);
        checkResult(ret);
    }

    public void addOnLePeso(ACBrEventListener<LePesoEventObject> pListener) {
        if (!hasListeners("onLePeso")) {
            ACBrBALInterop.INSTANCE.BAL_SetOnLePeso(getHandle(), new ACBrBALInterop.LePesoCallback() {
                @Override
                public void invoke(double value) {
                    onLePeso();
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
    public void removeOnLeCodigo(ACBrEventListener<LeCodigoEventObject> pListener) {
        removeListener("onLePeso", pListener);
        if (!hasListeners("onLePeso")) {
            ACBrBALInterop.INSTANCE.BAL_SetOnLePeso(getHandle(), null);
        }
    }

    /**
     * Leitura o codigo de barras.
     *
     * @return
     */
    public void onLePeso() {
        LeCodigoEventObject e = new LeCodigoEventObject(this);
        notifyListeners("onLePeso", e);
    }

    /**
     * Responsavel pela verificacao dos resultados a cada operacao.
     *
     * @param pResult resultado da operacao.
     * @throws ACBrException mensagem de erro caso nao tenha havido
     * processamento com sucesso.
     */
    @Override
    public void checkResult(int pResult) throws ACBrException {
        switch (pResult) {
            case -1: {
                String lMessage;
                final int LEN = 1024;
                ByteBuffer buffer = ByteBuffer.allocate(LEN);
                int ret = ACBrBALInterop.INSTANCE.BAL_GetUltimoErro(getHandle(), buffer, LEN);

                lMessage = fromUTF8(buffer, ret);
                throw new ACBrException(lMessage);
            }
            case -2: {
                throw new ACBrException("ACBr BAL não inicializado.");
            }
        }
    }

}
