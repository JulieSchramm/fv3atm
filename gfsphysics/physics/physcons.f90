!> \file physcons.f
!! This file contains module physcons

!  ==========================================================  !!!!!
!                 module  'physcons' description               !!!!!
!  ==========================================================  !!!!!
!                                                                      !
!   this module contains some the most frequently used math and        !
!   physics constatns for gcm models.                                  !
!                                                                      !
!   references:                                                        !
!     as set in NMC handbook from Smithsonian tables.                  !
!                                                                      !
!   modification history:                                              !
!                                                                      !
!     1990-04-30  g and rd are made consistent with NWS usage          !
!     2001-10-22  g made consistent with SI usage                      !
!     2005-04-13  added molecular weights for gases          - y-t hou !
!     2013-07-12  added temperature for homogen. nuc. for ice. - R.sun !
!                                                                      !
!   external modules referenced:                                       !
!                                                                      !
!       'module machine'                    in 'machine.f'             !
!                                                                      !
!                                                                      !
!!!!!  ==========================================================  !!!!!
!!!!!                       end descriptions                       !!!!!
!!!!!  ==========================================================  !!!!!

!> \ingroup rad 
!! \defgroup physcons physcons
!! This module contains some of the most frequently used math and physics 
!! constants for GCM models.
!! @{
!========================================!
          module physcons                !
!........................................!
!
  use machine,      only : kind_phys
!
  implicit none
!
  public

!> \name Math constants

!> pi
! real(kind=kind_phys),parameter:: con_pi     =3.1415926535897931 
  real(kind=kind_phys),parameter:: con_pi     =4.0d0*atan(1.0d0)
!> square root of 2
  real(kind=kind_phys),parameter:: con_sqrt2  =1.414214e+0_kind_phys
!> square root of 3
  real(kind=kind_phys),parameter:: con_sqrt3  =1.732051e+0_kind_phys

!> \name Geophysics/Astronomy constants

!> radius of earth (m)
  real(kind=kind_phys),parameter:: con_rerth  =6.3712e+6_kind_phys
!> gravity (\f$m/s^{2}\f$)
  real(kind=kind_phys),parameter:: con_g      =9.80665e+0_kind_phys
!> ang vel of earth (\f$s^{-1}\f$)
  real(kind=kind_phys),parameter:: con_omega  =7.2921e-5_kind_phys
!> std atms pressure (pa)
  real(kind=kind_phys),parameter:: con_p0     =1.01325e5_kind_phys
! real(kind=kind_phys),parameter:: con_solr   =1.36822e+3_kind_phys     ! solar constant    (W/m2)-aer(2001)
!> solar constant (\f$W/m^{2}\f$)-liu(2002)
  real(kind=kind_phys),parameter:: con_solr_old =1.3660e+3_kind_phys
!> solar constant (\f$W/m^{2}\f$)-nasa-sorce Tim(2008)
  real(kind=kind_phys),parameter:: con_solr   =1.3608e+3_kind_phys
! real(kind=kind_phys),parameter:: con_solr   =1.36742732e+3_kind_phys  ! solar constant    (W/m2)-gfdl(1989) - OPR as of Jan 2006

!> \name Thermodynamics constants

!> molar gas constant (\f$J/mol/K\f$)
  real(kind=kind_phys),parameter:: con_rgas   =8.314472_kind_phys
!> gas constant air (\f$J/kg/K\f$)
  real(kind=kind_phys),parameter:: con_rd     =2.8705e+2_kind_phys
!> gas constant H2O (\f$J/kg/K\f$)
  real(kind=kind_phys),parameter:: con_rv     =4.6150e+2_kind_phys
!> spec heat air at p (\f$J/kg/K\f$)
  real(kind=kind_phys),parameter:: con_cp     =1.0046e+3_kind_phys
!> spec heat air at v (\f$J/kg/K\f$)
  real(kind=kind_phys),parameter:: con_cv     =7.1760e+2_kind_phys
!> spec heat H2O gas (\f$J/kg/K\f$)
  real(kind=kind_phys),parameter:: con_cvap   =1.8460e+3_kind_phys
!> spec heat H2O liq (\f$J/kg/K\f$)
  real(kind=kind_phys),parameter:: con_cliq   =4.1855e+3_kind_phys
!> spec heat H2O ice (\f$J/kg/K\f$)
  real(kind=kind_phys),parameter:: con_csol   =2.1060e+3_kind_phys
!> lat heat H2O cond (\f$J/kg\f$)
  real(kind=kind_phys),parameter:: con_hvap   =2.5000e+6_kind_phys
! real(kind=kind_phys),parameter:: con_hvap   =2.5010e+6_kind_phys  ! from AMS
!> lat heat H2O fusion (\f$J/kg\f$)
  real(kind=kind_phys),parameter:: con_hfus   =3.3358e+5_kind_phys
! real(kind=kind_phys),parameter:: con_hfus   =3.3370e+5_kind_phys  ! from AMS
!> pres at H2O 3pt (Pa)
  real(kind=kind_phys),parameter:: con_psat   =6.1078e+2_kind_phys
!> temp at 0C (K)
  real(kind=kind_phys),parameter:: con_t0c    =2.7315e+2_kind_phys
!> temp at H2O 3pt (K)
  real(kind=kind_phys),parameter:: con_ttp    =2.7316e+2_kind_phys
!> temp freezing sea (K)
  real(kind=kind_phys),parameter:: con_tice   =2.7120e+2_kind_phys
!> joules per calorie
  real(kind=kind_phys),parameter:: con_jcal   =4.1855E+0_kind_phys
!> sea water reference density (\f$kg/m^{3}\f$)
  real(kind=kind_phys),parameter:: con_rhw0   =1022.0_kind_phys
!> min q for computing precip type
  real(kind=kind_phys),parameter:: con_epsq   =1.0E-12_kind_phys

!> \name Secondary constants

  real(kind=kind_phys),parameter:: con_rocp   =con_rd/con_cp
  real(kind=kind_phys),parameter:: con_cpor   =con_cp/con_rd
  real(kind=kind_phys),parameter:: con_rog    =con_rd/con_g
  real(kind=kind_phys),parameter:: con_fvirt  =con_rv/con_rd-1.
  real(kind=kind_phys),parameter:: con_eps    =con_rd/con_rv
  real(kind=kind_phys),parameter:: con_epsm1  =con_rd/con_rv-1.
  real(kind=kind_phys),parameter:: con_dldt   =con_cvap-con_cliq
  real(kind=kind_phys),parameter:: con_xpona  =-con_dldt/con_rv
  real(kind=kind_phys),parameter:: con_xponb  =-con_dldt/con_rv+con_hvap/(con_rv*con_ttp)

!> \name Other Physics/Chemistry constants (source: 2002 CODATA)

!> speed of light (\f$m/s\f$)
  real(kind=kind_phys),parameter:: con_c      =2.99792458e+8_kind_phys
!> planck constant (\f$J/s\f$)
  real(kind=kind_phys),parameter:: con_plnk   =6.6260693e-34_kind_phys
!> boltzmann constant (\f$J/K\f$)
  real(kind=kind_phys),parameter:: con_boltz  =1.3806505e-23_kind_phys
!> stefan-boltzmann (\f$W/m^{2}/K^{4}\f$)
  real(kind=kind_phys),parameter:: con_sbc    =5.670400e-8_kind_phys
!> avogadro constant (\f$mol^{-1}\f$)
  real(kind=kind_phys),parameter:: con_avgd   =6.0221415e23_kind_phys
!> vol of ideal gas at 273.15K, 101.325kPa (\f$m^{3}/mol\f$)
  real(kind=kind_phys),parameter:: con_gasv   =22413.996e-6_kind_phys
! real(kind=kind_phys),parameter:: con_amd    =28.970_kind_phys    ! molecular wght of dry air (g/mol)
!> molecular wght of dry air (\f$g/mol\f$)
  real(kind=kind_phys),parameter:: con_amd    =28.9644_kind_phys
!> molecular wght of water vapor (\f$g/mol\f$)
  real(kind=kind_phys),parameter:: con_amw    =18.0154_kind_phys
!> molecular wght of o3 (\f$g/mol\f$)
  real(kind=kind_phys),parameter:: con_amo3   =47.9982_kind_phys
! real(kind=kind_phys),parameter:: con_amo3   =48.0_kind_phys      ! molecular wght of o3  (g/mol)
!> molecular wght of co2 (\f$g/mol\f$)
  real(kind=kind_phys),parameter:: con_amco2  =44.011_kind_phys
!> molecular wght of o2 (\f$g/mol\f$)
  real(kind=kind_phys),parameter:: con_amo2   =31.9999_kind_phys
!> molecular wght of ch4 (\f$g/mol\f$)
  real(kind=kind_phys),parameter:: con_amch4  =16.043_kind_phys
!> molecular wght of n2o (\f$g/mol\f$)
  real(kind=kind_phys),parameter:: con_amn2o  =44.013_kind_phys
!> temperature the H.G.Nuc. ice starts
  real(kind=kind_phys), parameter:: con_thgni  =-38.15_kind_phys

!> \name Miscellaneous physics related constants (Moorthi - Jul 2014)

! integer, parameter :: max_lon=16000, max_lat=8000, min_lon=192, min_lat=94
! integer, parameter :: max_lon=5000,  max_lat=2500, min_lon=192, min_lat=94 ! current opr
! integer, parameter :: max_lon=5000,  max_lat=2000, min_lon=192, min_lat=94 ! current opr
! integer, parameter :: max_lon=8000,  max_lat=4000, min_lon=192, min_lat=94 ! current opr
! real(kind=kind_phys), parameter:: rlapse  = 0.65e-2, rhc_max = 0.9999      ! current opr
! real(kind=kind_phys), parameter:: rlapse  = 0.65e-2, rhc_max = 0.9999999   ! new
! real(kind=kind_phys), parameter:: rlapse  = 0.65e-2, rhc_max = 0.9900

  real(kind=kind_phys), parameter:: rlapse  = 0.65e-2_kind_phys
  real(kind=kind_phys), parameter:: cb2mb   = 10.0_kind_phys, pa2mb   = 0.01_kind_phys
! for wsm6
  real(kind=kind_phys),parameter:: rhowater = 1000._kind_phys         ! density of water (kg/m^3)
  real(kind=kind_phys),parameter:: rhosnow  = 100._kind_phys          ! density of snow (kg/m^3)
  real(kind=kind_phys),parameter:: rhoair   = 1.28_kind_phys          ! density of air near surface (kg/m^3)

  real(kind=kind_phys) :: dxmax, dxmin, dxinv, rhc_max
! For min/max hourly rh02m and t02m
  real(kind=kind_phys),parameter :: PQ0=379.90516E0_kind_phys
  real(kind=kind_phys),parameter :: A2A=17.2693882_kind_phys
  real(kind=kind_phys),parameter :: A3=273.16_kind_phys
  real(kind=kind_phys),parameter :: A4=35.86_kind_phys
  real(kind=kind_phys),parameter :: RHmin=1.0E-6_kind_phys
!........................................!
      end module physcons                !
!========================================!
!! @}
