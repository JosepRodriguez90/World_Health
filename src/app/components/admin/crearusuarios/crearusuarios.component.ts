import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import Swal from 'sweetalert2';
import { AdminService } from '../../../services/admin.service';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-crearusuarios',
  templateUrl: './crearusuarios.component.html',
  styleUrls: ['./crearusuarios.component.css']
})
export class CrearusuariosComponent implements OnInit {

  constructor(private formBuilder: FormBuilder,
    private router: Router,
    private AdminService: AdminService,
    public translate: TranslateService
    ) {this.translate.addLangs(['es', 'en']);}

    addForm: FormGroup;
    token: any;
    submitted = false;
    usuarioExiste;

    ngOnInit(): void {
      this.addForm = this.formBuilder.group({
        password: ['', Validators.required],
        firstName: ['', Validators.required],
        lastName: ['', Validators.required],
        telefon: ['', Validators.required],
        dni: ['', Validators.required],
        numero_colegiado: ['', Validators.required],
        especialidad: ['', Validators.required],
        email: ['', [Validators.required, Validators.email]]
      });

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
    else {

      this.AdminService.createUser(this.addForm.value).subscribe(
        (data) => {
          console.log(data);

          if(data.resultat == false){
            Swal.fire({
              icon: 'error',
              title: 'Error',
              text: 'Este numero de colegiado ya existe.',
            })
            return;
          }

          else if(data.resultat == true) {
            Swal.fire({
              icon: 'success',
              title: 'Se ha registrado correctamente',
              showConfirmButton: false,
              timer: 1500
            }).then((result) => {
              this.router.navigate(['medicosComponent']);
            });
          }
        }
      );
    }
  }

}
