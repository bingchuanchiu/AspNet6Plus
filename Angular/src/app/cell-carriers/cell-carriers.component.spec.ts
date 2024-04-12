import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CellCarriersComponent } from './cell-carriers.component';

describe('CellCarriersComponent', () => {
  let component: CellCarriersComponent;
  let fixture: ComponentFixture<CellCarriersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CellCarriersComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CellCarriersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
