package model;

public class Usuario {
    
    private int idUsuario;
    private String nickNameUsuario;
    private String emailUsuario;
    private String passwordUsuario;
    private int idCliente;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nickNameUsuario, String emailUsuario, String passwordUsuario, int idCliente) {
        this.idUsuario = idUsuario;
        this.nickNameUsuario = nickNameUsuario;
        this.emailUsuario = emailUsuario;
        this.passwordUsuario = passwordUsuario;
        this.idCliente = idCliente;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNickNameUsuario() {
        return nickNameUsuario;
    }

    public void setNickNameUsuario(String nickNameUsuario) {
        this.nickNameUsuario = nickNameUsuario;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getPasswordUsuario() {
        return passwordUsuario;
    }

    public void setPasswordUsuario(String passwordUsuario) {
        this.passwordUsuario = passwordUsuario;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
    
    
    
}
