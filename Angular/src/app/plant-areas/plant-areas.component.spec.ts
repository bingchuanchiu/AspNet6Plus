import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlantAreasComponent } from './plant-areas.component';

describe('PlantAreasComponent', () => {
  let component: PlantAreasComponent;
  let fixture: ComponentFixture<PlantAreasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlantAreasComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PlantAreasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
