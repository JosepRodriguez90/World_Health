import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModificarusuarisComponent } from './modificarusuaris.component';

describe('ModificarusuarisComponent', () => {
  let component: ModificarusuarisComponent;
  let fixture: ComponentFixture<ModificarusuarisComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModificarusuarisComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModificarusuarisComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
