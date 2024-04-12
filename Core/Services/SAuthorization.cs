using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Infrastructure.Repositories;

namespace Core.Services
{
    public class SAuthorization : IAuthorization
    {
        private JOCPaymentTrackingContext _DBContext = new JOCPaymentTrackingContext();
        private bool _disposedValue;

        public List<string> permissions { get; set; }
        public SAuthorization()
        {
            //InitAuthorizations(SLoggedInUser.userName);
        }
        public List<string> InitAuthorizations(string username)
        {
            List<string> tempPermissions = new List<string>();

            /*
             * bchiu = 1 is always the master account
             * ds\bwtapplication = 2 is used for testing on IIS10 that is appPool user
             * kmathew = 3 is master for now
             * guest = 4
             * 
             * 
             
             */



            var tempSuperUser = (from Users in _DBContext.Users
                                    where Users.Username == username
                                    & (Users.UserId == 1 || Users.UserId == 2 || Users.UserId == 3) 
                                 select Users.Username).ToList();

            List<string> tempUserRolePermissions = (from Users in _DBContext.Users
                                                    join UserAssignedRoles in _DBContext.UserAssignedRoles
                                                    on Users.UserId equals UserAssignedRoles.UserId
                                                    join Roles in _DBContext.Roles
                                                    on UserAssignedRoles.RoleId equals Roles.RoleId
                                                    join RoleAssignedPermissions in _DBContext.RoleAssignedPermissions
                                                    on Roles.RoleId equals RoleAssignedPermissions.RoleId
                                                    join Permissions in _DBContext.Permissions
                                                    on RoleAssignedPermissions.PermissionId equals Permissions.PermissionId
                                                    where Users.Username == username
                                                    select Permissions.PermissionName).ToList();

            List<string> tempUserGroupRolePermissions = (from Users in _DBContext.Users
                                                         join UserAssignedGroups in _DBContext.UserAssignedGroups
                                                         on Users.UserId equals UserAssignedGroups.UserId
                                                         join Groups in _DBContext.Groups
                                                         on UserAssignedGroups.GroupId equals Groups.GroupId
                                                         join GroupAssignedRoles in _DBContext.GroupAssignedRoles
                                                         on Groups.GroupId equals GroupAssignedRoles.GroupId
                                                         join Roles in _DBContext.Roles
                                                         on GroupAssignedRoles.RoleId equals Roles.RoleId
                                                         join RoleAssignedPermissions in _DBContext.RoleAssignedPermissions
                                                         on Roles.RoleId equals RoleAssignedPermissions.RoleId
                                                         join Permissions in _DBContext.Permissions
                                                         on RoleAssignedPermissions.PermissionId equals Permissions.PermissionId
                                                         where Users.Username == username
                                                         select Permissions.PermissionName).ToList();

            if (tempSuperUser.Count > 0)
            {
                //ADDS SUPER USER TO USER #1, OTHERWISE THIS HAS TO BE MANUALLY ADDED AND CONFIGURED
                tempPermissions.Add("SuperUser");
            }
            else
            {
                tempPermissions.Union(tempUserRolePermissions.Union(tempUserGroupRolePermissions)).Distinct();
            }

            permissions = tempPermissions;
            return permissions;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)
                    _DBContext = null;
                    permissions = null;
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                _disposedValue = true;
            }
        }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

 
    }
}
