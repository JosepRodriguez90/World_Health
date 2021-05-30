import { Component, OnInit } from '@angular/core';
import { UsuariosService } from '../../services/usuarios.service';
import { ApiResponse } from '../../model/api-response';
import { Router } from '@angular/router';
import { Usuarios } from '../../model/usuarios';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-usuario-perfil',
  templateUrl: './usuario-perfil.component.html',
  styleUrls: ['./usuario-perfil.component.css']
})
export class UsuarioPerfilComponent implements OnInit {

  usuario: Usuarios;

  constructor(
    private apiService: UsuariosService,
    private router : Router
  ) { }

  ngOnInit(): void {
    const correo = environment.correu;
    console.log(correo);

    this.apiService.mostrarPerfil(correo).subscribe((data: Usuarios) => {
      this.usuario = data;
      console.log("el DNI del usuario loguejat es: "+this.usuario.dni);
      console.log("entre al php");

      // this.usuario.dni = data.dni;
    })
  }

}
