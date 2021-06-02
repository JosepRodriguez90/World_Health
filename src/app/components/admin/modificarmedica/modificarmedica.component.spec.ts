import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModificarmedicaComponent } from './modificarmedica.component';

describe('ModificarmedicaComponent', () => {
  let component: ModificarmedicaComponent;
  let fixture: ComponentFixture<ModificarmedicaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModificarmedicaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModificarmedicaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
