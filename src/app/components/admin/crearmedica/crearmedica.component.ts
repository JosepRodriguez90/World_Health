import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import Swal from 'sweetalert2';
import { AdminService } from '../../../services/admin.service';

@Component({
  selector: 'app-crearmedica',
  templateUrl: './crearmedica.component.html',
  styleUrls: ['./crearmedica.component.css']
})
export class CrearmedicaComponent implements OnInit {
  static medicamentos: unknown[];

  constructor(private formBuilder: FormBuilder,
  private router: Router,
  private AdminService: AdminService
  ) { }

  addForm: FormGroup;
  token: any;
  submitted = false;
  usuarioExiste;

  ngOnInit(): void {
    this.addForm = this.formBuilder.group({
      Nombre: ['', Validators.required],
      composicion: ['', Validators.required],
      codigo: ['', Validators.required],
      comentarios: ['', Validators.required]
    });

  }

  get f() {
    return this.addForm.controls;
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

    this.AdminService.createMedica(this.addForm.value).subscribe(
      (data) => {
        console.log(data);

        if (data) {
          Swal.fire({
            icon: 'success',
            title: 'Se ha registrado correctamente',
            showConfirmButton: false,
            timer: 1500
          }).then((result) => {
            this.router.navigate(['medicamientosComponent']);
          });
        }
        else {
          Swal.fire({
            icon: 'error',
            title: data,
            showConfirmButton: false,
            timer: 1500
          });
        }
      }
    );
  }
}

}
