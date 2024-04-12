import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DblogsEditComponent } from './db-logs-edit.component';

describe('DblogsEditComponent', () => {
  let component: DblogsEditComponent;
  let fixture: ComponentFixture<DblogsEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DblogsEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DblogsEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
