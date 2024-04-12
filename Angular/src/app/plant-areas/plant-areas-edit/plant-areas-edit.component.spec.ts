import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlantAreasEditComponent } from './plant-areas-edit.component';

describe('PlantAreasEditComponent', () => {
  let component: PlantAreasEditComponent;
  let fixture: ComponentFixture<PlantAreasEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlantAreasEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PlantAreasEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
