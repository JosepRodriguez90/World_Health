import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MedicamientosComponent } from './medicamientos.component';

describe('MedicamientosComponent', () => {
  let component: MedicamientosComponent;
  let fixture: ComponentFixture<MedicamientosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MedicamientosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MedicamientosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
