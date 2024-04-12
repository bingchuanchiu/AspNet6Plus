using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Infrastructure.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Protocols;
using System.IO;
using System.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Hosting;

#nullable disable

namespace Infrastructure.Repositories
{
    public partial class SeedSolutionContext : DbContext
    {        
        public SeedSolutionContext()
        {
        }

        public SeedSolutionContext(DbContextOptions<SeedSolutionContext> options)
            : base(options)
        {
        }

        public string ASPNETCORE_ENVIRONMENT { get; set; }

        public virtual DbSet<CellCarrier> CellCarriers { get; set; }
        public virtual DbSet<ConfirmationCode> ConfirmationCodes { get; set; }
        public virtual DbSet<Dblog> Dblogs { get; set; }
        public virtual DbSet<EmailLog> EmailLogs { get; set; }
        public virtual DbSet<ExceptionLog> ExceptionLogs { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<GroupAssignedOu> GroupAssignedOus { get; set; }
        public virtual DbSet<GroupAssignedRole> GroupAssignedRoles { get; set; }
        public virtual DbSet<Ou> Ous { get; set; }
        public virtual DbSet<OuassignedRole> OuassignedRoles { get; set; }
        public virtual DbSet<Password> Passwords { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<Plant> Plants { get; set; }
        public virtual DbSet<PlantArea> PlantAreas { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<RoleAssignedPermission> RoleAssignedPermissions { get; set; }
        public virtual DbSet<Setting> Settings { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserAssignedCellCarrier> UserAssignedCellCarriers { get; set; }
        public virtual DbSet<UserAssignedGroup> UserAssignedGroups { get; set; }
        public virtual DbSet<UserAssignedRole> UserAssignedRoles { get; set; }
        public virtual DbSet<UserLog> UserLogs { get; set; }
        public virtual DbSet<UserOu> UserOus { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }
   
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                // optionsBuilder.UseSqlServer("Server=BWT-2F-BCHIU;Database=SeedSolution;Trusted_Connection=True;");


                //10/3/2022 @ 11:45am TESTED AND WORKS
                var myJsonString = File.ReadAllText("../Infrastructure/appsettings.json");
                var myJObject = JObject.Parse(myJsonString);


                optionsBuilder.UseSqlServer(myJObject.SelectToken("ConnectionStrings").SelectToken("DevConnection").ToString());

                

                /*
                 * ConfigurationManager.ConnectionStrings and ConfigurationManager.AppSettings both returns null.
                 * 
                 * 
                optionsBuilder.UseSqlServer(ConfigurationManager.AppSettings["ConnectionStrings:DefaultConnection"]);
                */
            }

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<CellCarrier>(entity =>
            {
                entity.Property(e => e.CellCarrierId).HasColumnName("cell_carrier_id");

                entity.Property(e => e.CellCarrierName)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("cell_carrier_name");

                entity.Property(e => e.SmsGateway)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("sms_gateway");

                entity.Property(e => e.SmsNotifications).HasColumnName("sms_notifications");
            });

            modelBuilder.Entity<ConfirmationCode>(entity =>
            {
                entity.HasKey(e => e.ConfirmationCodeId);

                entity.Property(e => e.ConfirmationCodeId).HasColumnName("confirmation_code_id");

                entity.Property(e => e.Code)
                    .HasMaxLength(10)
                    .HasColumnName("code")
                    .IsFixedLength(true);

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasColumnName("type")
                    .IsFixedLength(true);

                entity.Property(e => e.Url)
                    .HasMaxLength(150)
                    .HasColumnName("url");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ConfirmationCodes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ConfirmationCodes_Users");
            });

            modelBuilder.Entity<Dblog>(entity =>
            {
                entity.ToTable("DBLogs");

                entity.Property(e => e.DbLogId).HasColumnName("db_log_id");

                entity.Property(e => e.ColumnName).HasColumnName("column_name");

                entity.Property(e => e.ColumnNewValue).HasColumnName("column_new_value");

                entity.Property(e => e.ColumnOldValue).HasColumnName("column_old_value");

                entity.Property(e => e.ColumnType).HasColumnName("column_type");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.TableName).HasColumnName("table_name");
            });

            modelBuilder.Entity<EmailLog>(entity =>
            {
                entity.Property(e => e.EmailLogId).HasColumnName("email_log_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.EmailAttachment).HasColumnName("email_attachment");

                entity.Property(e => e.EmailBcc).HasColumnName("email_bcc");

                entity.Property(e => e.EmailBody).HasColumnName("email_body");

                entity.Property(e => e.EmailCc).HasColumnName("email_cc");

                entity.Property(e => e.EmailFrom)
                    .HasMaxLength(150)
                    .HasColumnName("email_from");

                entity.Property(e => e.EmailSubject)
                    .HasMaxLength(150)
                    .HasColumnName("email_subject");

                entity.Property(e => e.EmailTo).HasColumnName("email_to");
            });

            modelBuilder.Entity<ExceptionLog>(entity =>
            {
                entity.Property(e => e.ExceptionLogId).HasColumnName("exception_log_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.InnerException).HasColumnName("inner_exception");

                entity.Property(e => e.Message).HasColumnName("message");

                entity.Property(e => e.StackTrace).HasColumnName("stack_trace");
            });

            modelBuilder.Entity<Group>(entity =>
            {
                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.DeletedAt).HasColumnName("deleted_at");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(100)
                    .HasColumnName("display_name");

                entity.Property(e => e.EmailNotifications).HasColumnName("email_notifications");

                entity.Property(e => e.Enabled).HasColumnName("enabled");

                entity.Property(e => e.GroupName)
                    .HasMaxLength(100)
                    .HasColumnName("group_name");

                entity.Property(e => e.SmsNotifications).HasColumnName("sms_notifications");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");
            });

            modelBuilder.Entity<GroupAssignedOu>(entity =>
            {
                entity.ToTable("GroupAssignedOUs");

                entity.Property(e => e.GroupAssignedOuId).HasColumnName("group_assigned_ou_id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.OuId).HasColumnName("ou_id");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.GroupAssignedOus)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedOUs_Groups");

                entity.HasOne(d => d.Ou)
                    .WithMany(p => p.GroupAssignedOus)
                    .HasForeignKey(d => d.OuId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedOUs_OUs");
            });

            modelBuilder.Entity<GroupAssignedRole>(entity =>
            {
                entity.Property(e => e.GroupAssignedRoleId).HasColumnName("group_assigned_role_id");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.GroupAssignedRoles)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedRoles_Groups");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.GroupAssignedRoles)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAssignedRoles_Roles");
            });

            modelBuilder.Entity<Ou>(entity =>
            {
                entity.ToTable("OUs");

                entity.Property(e => e.OuId).HasColumnName("ou_id");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.OuName).HasColumnName("ou_name");

                entity.Property(e => e.Type)
                    .HasMaxLength(5)
                    .HasColumnName("type")
                    .IsFixedLength(true)
                    .HasComment("group | role");
            });

            modelBuilder.Entity<OuassignedRole>(entity =>
            {
                entity.ToTable("OUAssignedRoles");

                entity.Property(e => e.OuAssignedRoleId).HasColumnName("ou_assigned_role_id");

                entity.Property(e => e.OuId).HasColumnName("ou_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Ou)
                    .WithMany(p => p.OuassignedRoles)
                    .HasForeignKey(d => d.OuId)
                    .HasConstraintName("FK_OUAssignedRoles_OUs");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.OuassignedRoles)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_OUAssignedRoles_Roles");
            });

            modelBuilder.Entity<Password>(entity =>
            {
                entity.Property(e => e.PasswordId).HasColumnName("password_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.NeverExpires).HasColumnName("never_expires");

                entity.Property(e => e.PasswordSecret).HasColumnName("password_secret");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Passwords)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Passwords_Users");
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(100)
                    .HasColumnName("display_name");

                entity.Property(e => e.PermissionName)
                    .HasMaxLength(100)
                    .HasColumnName("permission_name");

                entity.Property(e => e.TableName)
                    .HasMaxLength(100)
                    .HasColumnName("table_name");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");
            });

            modelBuilder.Entity<Plant>(entity =>
            {
                entity.Property(e => e.PlantId).HasColumnName("plant_id");

                entity.Property(e => e.Address).HasColumnName("address");

                entity.Property(e => e.Heading).HasColumnName("heading");

                entity.Property(e => e.Height).HasColumnName("height");

                entity.Property(e => e.HopperSize).HasColumnName("hopper_size");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.IsDewatering).HasColumnName("is_dewatering");

                entity.Property(e => e.Latitude).HasColumnName("latitude");

                entity.Property(e => e.Longitude).HasColumnName("longitude");

                entity.Property(e => e.Pitch).HasColumnName("pitch");

                entity.Property(e => e.PlantName).HasColumnName("plant_name");

                entity.Property(e => e.PlantNumber).HasColumnName("plant_number");

                entity.Property(e => e.Roll).HasColumnName("roll");
            });

            modelBuilder.Entity<PlantArea>(entity =>
            {
                entity.Property(e => e.PlantAreaId).HasColumnName("plant_area_id");

                entity.Property(e => e.PlantAreaName).HasColumnName("plant_area_name");

                entity.Property(e => e.PlantId).HasColumnName("plant_id");

                entity.HasOne(d => d.Plant)
                    .WithMany(p => p.PlantAreas)
                    .HasForeignKey(d => d.PlantId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlantAreas_Plants");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DeletedAt).HasColumnName("deleted_at");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(100)
                    .HasColumnName("display_name");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(100)
                    .HasColumnName("role_name");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");
            });

            modelBuilder.Entity<RoleAssignedPermission>(entity =>
            {
                entity.Property(e => e.RoleAssignedPermissionId).HasColumnName("role_assigned_permission_id");

                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.RoleAssignedPermissions)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RoleAssignedPermissions_Permissions");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RoleAssignedPermissions)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RoleAssignedPermissions_Roles");
            });

            modelBuilder.Entity<Setting>(entity =>
            {
                entity.Property(e => e.SettingId).HasColumnName("setting_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(50)
                    .HasColumnName("display_name");

                entity.Property(e => e.SettingName)
                    .HasMaxLength(50)
                    .HasColumnName("setting_name");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.Value).HasColumnName("value");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("email");

                entity.Property(e => e.EmailNotifications).HasColumnName("email_notifications");

                entity.Property(e => e.Emplid)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("emplid")
                    .IsFixedLength(true);

                entity.Property(e => e.Firstname)
                    .HasMaxLength(100)
                    .HasColumnName("firstname");

                entity.Property(e => e.IsDisabled).HasColumnName("is_disabled");

                entity.Property(e => e.Lastname)
                    .HasMaxLength(100)
                    .HasColumnName("lastname");

                entity.Property(e => e.LdapWhenChanged).HasColumnName("ldap_whenChanged");

                entity.Property(e => e.LdapWhenCreated).HasColumnName("ldap_whenCreated");

                entity.Property(e => e.LockoutTime).HasColumnName("lockout_time");

                entity.Property(e => e.Thumbnail)
                    .IsUnicode(false)
                    .HasColumnName("thumbnail");

                entity.Property(e => e.UpdatedAt).HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy).HasColumnName("updated_by");

                entity.Property(e => e.UserTypeId).HasColumnName("user_type_id");

                entity.Property(e => e.Username)
                    .HasMaxLength(100)
                    .HasColumnName("username");

                entity.HasOne(d => d.UserType)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.UserTypeId)
                    .HasConstraintName("FK_Users_UserTypes");
            });

            modelBuilder.Entity<UserAssignedCellCarrier>(entity =>
            {
                entity.Property(e => e.UserAssignedCellCarrierId).HasColumnName("user_assigned_cellcarrier_id");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.CellCarrierId).HasColumnName("cell_carrier_id");

                entity.Property(e => e.Cellphone)
                    .IsRequired()
                    .HasMaxLength(15)
                    .HasColumnName("cellphone");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.CellCarrier)
                    .WithMany(p => p.UserAssignedCellCarriers)
                    .HasForeignKey(d => d.CellCarrierId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedCellCarriers_CellCarriers1");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserAssignedCellCarriers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedCellCarriers_Users");
            });

            modelBuilder.Entity<UserAssignedGroup>(entity =>
            {
                entity.Property(e => e.UserAssignedGroupId).HasColumnName("user_assigned_group_id");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.UserAssignedGroups)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedGroups_Groups");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserAssignedGroups)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedGroups_Users");
            });

            modelBuilder.Entity<UserAssignedRole>(entity =>
            {
                entity.Property(e => e.UserAssignedRoleId).HasColumnName("user_assigned_role_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserAssignedRoles)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserAssignedRoles_Roles");
            });

            modelBuilder.Entity<UserLog>(entity =>
            {
                entity.Property(e => e.UserLogId).HasColumnName("user_log_id");

                entity.Property(e => e.Action)
                    .HasMaxLength(50)
                    .HasColumnName("action");

                entity.Property(e => e.Controller)
                    .HasMaxLength(50)
                    .HasColumnName("controller");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.Message).HasColumnName("message");

                entity.Property(e => e.UrlCurrent).HasColumnName("url_current");

                entity.Property(e => e.UrlReferral).HasColumnName("url_referral");

                entity.Property(e => e.ClientIP).HasColumnName("client_ip");

                entity.Property(e => e.UserAgent).HasColumnName("user_agent");
            });

            modelBuilder.Entity<UserOu>(entity =>
            {
                entity.ToTable("UserOUs");

                entity.Property(e => e.UserOuId).HasColumnName("user_ou_id");

                entity.Property(e => e.CreatedAt).HasColumnName("created_at");

                entity.Property(e => e.OuName).HasColumnName("ou_name");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserOus)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserOUs_Users");
            });

            modelBuilder.Entity<UserType>(entity =>
            {
                entity.Property(e => e.UserTypeId).HasColumnName("user_type_id");

                entity.Property(e => e.UserTypeName)
                    .HasMaxLength(100)
                    .HasColumnName("user_type_name");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
