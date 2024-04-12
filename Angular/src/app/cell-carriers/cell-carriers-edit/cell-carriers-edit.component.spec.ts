import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CellCarriersEditComponent } from './cell-carriers-edit.component';

describe('CellCarriersEditComponent', () => {
  let component: CellCarriersEditComponent;
  let fixture: ComponentFixture<CellCarriersEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CellCarriersEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CellCarriersEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
