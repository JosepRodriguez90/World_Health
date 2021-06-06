import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CrearmedicaComponent } from './crearmedica.component';

describe('CrearmedicaComponent', () => {
  let component: CrearmedicaComponent;
  let fixture: ComponentFixture<CrearmedicaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CrearmedicaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CrearmedicaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
