import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router, Params, ActivatedRoute } from '@angular/router';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import Swal from 'sweetalert2';
import { AdminService } from '../../../services/admin.service';
import { User } from 'src/app/model/User';
import { updateUsuaris } from 'src/app/model/updateUsuaris';
import { consultarusuaris } from '../../../model/consultarusuaris';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-modificarusuaris',
  templateUrl: './modificarusuaris.component.html',
  styleUrls: ['./modificarusuaris.component.css']
})
export class ModificarusuarisComponent implements OnInit {

  constructor(private formBuilder: FormBuilder,
    private AdminService: AdminService,
    private router: Router,
    private routes: ActivatedRoute) { }

    addForm: FormGroup;
    token: any;
    submitted = false;
    usuarioExiste;
    usuariossup;

    idusuari: string;
    usuarios: any[][];
    usu;
    correo: any;

  ngOnInit(): void {

    this.correo = environment.correu;

    this.addForm = this.formBuilder.group({
      id: [],
      password: ['', Validators.required],
      password2: ['', Validators.required],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      telefon: ['', Validators.required],
      dni: ['', Validators.required],
      numero_colegiado: ['', Validators.required],
      especialidad: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]]
    });
    this.AdminService.updateMedica;

    this.idusuari = localStorage.getItem('idusuari')
    this.usu = new consultarusuaris(this.idusuari)
    console.log(this.usu)
    this.AdminService.idmostrarusuaris(this.usu)
    .subscribe (
      datos => {
        console.log(datos)
        this.usuarios = Object.values(datos)
        console.log(this.usuarios);
      })

  }

  get f() {
    return this.addForm.controls;
  }


  mostrarContrasena() {
    let tipo: any = document.getElementById("password");
    if (tipo.type == "password") {
      tipo.type = "text";
    } else {
      tipo.type = "password";
    }
  }

  mostrarContrasena2() {
    let tipo: any = document.getElementById("password2");
    if (tipo.type == "password") {
      tipo.type = "text";
    } else {
      tipo.type = "password";
    }
  }


  onSubmit() {
    this.submitted = true;
    console.log(this.addForm.value);

    if (this.addForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Los datos no son correctos.',
      })
      return;
    }
    else if (this.addForm.value.password != this.addForm.value.password2) {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Las contraseñas no coinciden.',
      })
      return;
    }
    else {

      this.AdminService.updateUsuaris(this.addForm.value).subscribe(
        (data) => {
          console.log(data);


            Swal.fire({
              icon: 'success',
              title: 'Se ha modificado correctamente',
              showConfirmButton: false,
              timer: 1500
            }).then((result) => {
              if(this.correo=="admin@admin.com"){
                this.router.navigate(['medicosComponent']);
              }
              else{
                this.router.navigate(['../../usuario-perfil']);
              }

            });


        }
      );
    }
  }
}
