import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InteligenciaComponent } from './inteligencia.component';

describe('InteligenciaComponent', () => {
  let component: InteligenciaComponent;
  let fixture: ComponentFixture<InteligenciaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InteligenciaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InteligenciaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
