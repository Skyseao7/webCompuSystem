package modelo;

import java.util.ArrayList;

public class Pedido {
    private int idPedido;
    private Cliente cliente;
    private String fechaPedido;
    private String estado;
    private ArrayList<DetallePedido> detalles = new ArrayList<>();
    private Pago pago;

    public Pedido() {
        cliente = new Cliente();
    }

    
    public ArrayList<DetallePedido> getDetalles() {
        return detalles;
    }

    public void setDetalles(ArrayList<DetallePedido> detalles) {
        this.detalles = detalles;
    }

    public Pago getPago() {
        return pago;
    }

    public void setPago(Pago pago) {
        this.pago = pago;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(String fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    @Override
    public String toString() {
        return "Pedido{" + "idPedido=" + idPedido + ", cliente=" + cliente + ", fechaPedido=" + fechaPedido + ", estado=" + estado + ", detalles=" + detalles + ", pago=" + pago + '}';
    }
}
