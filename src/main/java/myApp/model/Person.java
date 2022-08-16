package myApp.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "person")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "username")
    private String username;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "pas_ser")
    private String pas_ser;

    @Column(name = "pass_num")
    private String pass_num;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    @Column(name = "birthdate")
    private String birthdate;

    public Person() {
    }

    public Person(String username, String name, String surname, String pas_ser, String pass_num, String address, String phone, String birthdate) {
        this.username = username;
        this.name = name;
        this.surname = surname;
        this.pas_ser = pas_ser;
        this.pass_num = pass_num;
        this.address = address;
        this.phone = phone;
        this.birthdate = birthdate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPas_ser() {
        return pas_ser;
    }

    public void setPas_ser(String pas_ser) {
        this.pas_ser = pas_ser;
    }

    public String getPass_num() {
        return pass_num;
    }

    public void setPass_num(String pass_num) {
        this.pass_num = pass_num;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }
}
