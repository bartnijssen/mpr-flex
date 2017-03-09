module get_ixname
! Define functions to get the index of a named variable
use nrtype                  ! variable types, etc.
use public_var

implicit none

private

public::get_ixPar     ! assign variable index to parameter 
public::get_ixDataMap       ! assign variable index to variables in mapping netCDF data
public::get_ixDataVeg       ! assign variable index to variables in veg netCDF data
public::get_ixDataSoil      ! assign variable index to variables in soil netCDF data
public::get_ixPrpVeg

contains

! *******************************************************************************************************************
! function: get the index of the named variables for parameters 
! *******************************************************************************************************************
 function get_ixPar(varName)
  use var_lookup,only:ixPar             ! indices of the named variables
  implicit none
  ! define dummy variables
  character(*), intent(in) :: varName     ! variable name
  integer(i4b)             :: get_ixPar   ! index of the named variable

  select case(trim(varName))
    ! Gamma parameters 
    case('ks1gamma1');        get_ixPar = ixPar%ks1gamma1         ! gamma parameter-1 for 1st ksat transfer function (Cosby et al. 1984) 
    case('ks1gamma2');        get_ixPar = ixPar%ks1gamma2         ! gamma parameter-2 for 1st ksat transfer function (Cosby et al. 1984) 
    case('ks1gamma3');        get_ixPar = ixPar%ks1gamma3         ! gamma parameter-3 for 1st ksat transfer function (Cosby et al. 1984) 
    case('ks2gamma1');        get_ixPar = ixPar%ks2gamma1         ! gamma parameter-1 for 2nd ksat transfer function 
    case('ks2gamma2');        get_ixPar = ixPar%ks2gamma2         ! gamma parameter-2 for 2nd ksat transfer function 
    case('ks2gamma3');        get_ixPar = ixPar%ks2gamma3         ! gamma parameter-3 for 2nd ksat transfer function 
    case('phi1gamma1');       get_ixPar = ixPar%phi1gamma1        ! gamma parameter-1 for 1st porosity transfer function (Cosby et al. 1984) 
    case('phi1gamma2');       get_ixPar = ixPar%phi1gamma2        ! gamma parameter-2 for 1st porosity transfer function (Cosby et al. 1984) 
    case('phi1gamma3');       get_ixPar = ixPar%phi1gamma3        ! gamma parameter-3 for 1st porosity transfer function (Cosby et al. 1984) 
    case('phi2gamma1');       get_ixPar = ixPar%phi2gamma1        ! gamma parameter-1 for 2nd porosity transfer function 
    case('phi2gamma2');       get_ixPar = ixPar%phi2gamma2        ! gamma parameter-2 for 2nd porosity transfer function 
    case('phi2gamma3');       get_ixPar = ixPar%phi2gamma3        ! gamma parameter-3 for 2nd porosity transfer function 
    case('phi2gamma4');       get_ixPar = ixPar%phi2gamma4        ! gamma parameter-4 for 2nd porosity transfer function 
    case('phi2gamma5');       get_ixPar = ixPar%phi2gamma5        ! gamma parameter-5 for 2nd porosity transfer function 
    case('phi2gamma6');       get_ixPar = ixPar%phi2gamma6        ! gamma parameter-6 for 2nd porosity transfer function 
    case('fc1gamma1');        get_ixPar = ixPar%fc1gamma1         ! gamma parameter-1 for 1st field capacity transfer function (koren et al. 2003)
    case('wp1gamma1');        get_ixPar = ixPar%wp1gamma1         ! gamma parameter-1 for 1st wilting point transfer function (koren et al. 2003) 
    case('b1gamma1');         get_ixPar = ixPar%b1gamma1          ! gamma parameter-1 for 1st retention curve slope transfer function (cosby et al. 1984)
    case('b1gamma2');         get_ixPar = ixPar%b1gamma2          ! gamma parameter-2 for 1st retention curve slope transfer function (cosby et al. 1984)
    case('b1gamma3');         get_ixPar = ixPar%b1gamma3          ! gamma parameter-3 for 1st retention curve slope transfer function (Cosby et al. 1984)
    case('psis1gamma1');      get_ixPar = ixPar%psis1gamma1       ! gamma parameter-1 for 1st saturation potential matric transfer function (koren et al. 2003)
    case('psis1gamma2');      get_ixPar = ixPar%psis1gamma2       ! gamma parameter-2 for 1st saturation potential matric transfer function (koren et al. 2003)
    case('psis1gamma3');      get_ixPar = ixPar%psis1gamma3       ! gamma parameter-3 for 1st saturation potential matric transfer function (koren et al. 2003)
    case('myu1gamma1');       get_ixPar = ixPar%myu1gamma1        ! gamma parameter-1 for 1st specific yield transfer function (koren et al. 2003)   
    case('myu1gamma2');       get_ixPar = ixPar%myu1gamma2        ! gamma parameter-2 for 1st specific yield transfer function (koren et al. 2003) 
    case('z1gamma1');         get_ixPar = ixPar%z1gamma1          ! gamma parameter-1 for total soil column depth or bucket size [m] (multiplier)
    case('h1gamma1');         get_ixPar = ixPar%h1gamma1          ! gamma parameter-1 for top layer thickness [m] (fraction of z)
    case('h2gamma1');         get_ixPar = ixPar%h2gamma1          ! gamma parameter-1 2nd layer thickness [m] (franction of z)
    case('binfilt1gamma1');   get_ixPar = ixPar%binfilt1gamma1    ! gamma parameter-1 for variable infilitration curve parameter 
    case('binfilt1gamma2');   get_ixPar = ixPar%binfilt1gamma2    ! gamma parameter-2 for variable infilitration curve parameter 
    case('D11gamma1');        get_ixPar = ixPar%D11gamma1         ! gamma parameter-1 for linear reservoir coefficient 
    case('D21gamma1');        get_ixPar = ixPar%D21gamma1         ! gamma parameter-1 for nonlinear reservoir coefficient 
    case('D31gamma1');        get_ixPar = ixPar%D31gamma1         ! gamma parameter-1 for nonlinear reservoir water content adjustment 
    case('D41gamma1');        get_ixPar = ixPar%D41gamma1         ! gamma parameter-1 for exponent of nonlinear reservoir 
    case('exp1gamma1');       get_ixPar = ixPar%exp1gamma1        ! gamma parameter-1 for exponent in Campbell equatin for Kh
    case('exp1gamma2');       get_ixPar = ixPar%exp1gamma2        ! gamma parameter-2 for exponent in Campbell equatin for Kh
    case('bbl1gamma1');       get_ixPar = ixPar%bbl1gamma1        ! gamma parameter-1 for bubbling pressure of soil [cm] 
    case('bbl1gamma2');       get_ixPar = ixPar%bbl1gamma2        ! gamma parameter-2 for bubbling pressure of soil [cm] 
    case('sd1gamma1');        get_ixPar = ixPar%sd1gamma1         ! gamma parameter-1 for soil particle density [kg/m^3]
    case('bd1gamma1');        get_ixPar = ixPar%bd1gamma1         ! gamma parameter-1 for bulk density [kg/m^3]
    case('WcrFrac1gamma1');   get_ixPar = ixPar%WcrFrac1gamma1    ! gamma parameter-1 for Fractional soil moisture content at critical point [-] 
    case('WpwpFrac1gamma1');  get_ixPar = ixPar%WpwpFrac1gamma1   ! gamma parameter-1 for Fractional soil moisture content at wilting point [-]  
    case('fsm1gamma1');       get_ixPar = ixPar%fsm1gamma1        ! 
    case('zk1gamma1');        get_ixPar = ixPar%zk1gamma1         ! 
    case('zsk1gamma1');       get_ixPar = ixPar%zsk1gamma1        ! 
    case('zsk1gamma2');       get_ixPar = ixPar%zsk1gamma2        ! 
    case('zpk1gamma1');       get_ixPar = ixPar%zpk1gamma1        ! 
    case('pfree1gamma1');     get_ixPar = ixPar%pfree1gamma1      ! 
    case('rexp1gamma1');      get_ixPar = ixPar%rexp1gamma1       ! 
    case('lai1gamma1');       get_ixPar = ixPar%lai1gamma1        ! gamma parameter-1 for monthly lai (multiplier) 
    ! Beta parameters
    case('uhshape');          get_ixPar = ixPar%uhshape           ! gamma pdf uh shape parameter [-]
    case('uhscale');          get_ixPar = ixPar%uhscale           ! gamma pdf uh scale parameter [-] 
    case('ks');               get_ixPar = ixPar%ks                ! saturated hydrologic conductivity [mm/day]
    case('bd');               get_ixPar = ixPar%bd                ! soil particle density [kg/m^3]
    case('sd');               get_ixPar = ixPar%sd                ! soil particle density [kg/m^3]
    case('psis');             get_ixPar = ixPar%psis              ! matric potential [kPa]  
    case('b');                get_ixPar = ixPar%b                 ! Fractional soil moisture content at wilting point [-]  
    case('phi');              get_ixPar = ixPar%phi               ! porosity [-]  
    case('fc');               get_ixPar = ixPar%fc                ! field capacity[-]  
    case('wp');               get_ixPar = ixPar%wp                ! wilting point [-]  
    case('myu');              get_ixPar = ixPar%myu               ! Fractional soil moisture content at wilting point [-]  
    case('binfilt');          get_ixPar = ixPar%binfilt           ! variable infilitration curve parameter 
    case('D1');               get_ixPar = ixPar%D1                ! 
    case('D4');               get_ixPar = ixPar%D4                ! 
    case('D2');               get_ixPar = ixPar%D2                ! 
    case('D3');               get_ixPar = ixPar%D3                ! 
    case('c');                get_ixPar = ixPar%c                 ! 
    case('Dsmax');            get_ixPar = ixPar%Dsmax             !  
    case('Ds');               get_ixPar = ixPar%Ds                ! 
    case('Ws');               get_ixPar = ixPar%Ws                ! 
    case('expt');             get_ixPar = ixPar%expt              ! exponent in Campbell equatin for Kh
    case('bbl');              get_ixPar = ixPar%bbl               ! bubbling pressure of soil [cm] 
    case('h1');               get_ixPar = ixPar%h1                ! top layer thickness [m] 
    case('h2');               get_ixPar = ixPar%h2                ! 2nd layer thickness [m] 
    case('h3');               get_ixPar = ixPar%h3                ! 3rd layer thickness [m] 
    case('h4');               get_ixPar = ixPar%h4                ! 4th layer thickness [m] 
    case('h5');               get_ixPar = ixPar%h5                ! 5th layer thickness [m] 
    case('z');                get_ixPar = ixPar%z                 ! total depth of soil [m] 
    case('WcrFrac');          get_ixPar = ixPar%WcrFrac           ! Fractional soil moisture content at critical point [-] 
    case('WpwpFrac');         get_ixPar = ixPar%WpwpFrac          ! Fractional soil moisture content at wilting point [-]  
    case('twm');              get_ixPar = ixPar%twm               ! Tention water content [mm]
    case('fwm');              get_ixPar = ixPar%fwm               ! Free water content [mm] 
    case('fsm');              get_ixPar = ixPar%fsm               ! Supplemental free water content [mm] 
    case('fpm');              get_ixPar = ixPar%fpm               ! Primary free water content [mm]
    case('zk');               get_ixPar = ixPar%zk                ! draw coefficient from free water content [/day]
    case('zsk');              get_ixPar = ixPar%zsk               ! draw coefficient from supplemental free water content [/day]
    case('zpk');              get_ixPar = ixPar%zpk               ! draw coefficient form primary free water content [/day]
    case('pfree');            get_ixPar = ixPar%pfree             !  
    case('zperc');            get_ixPar = ixPar%zperc             ! 
    case('rexp');             get_ixPar = ixPar%rexp              ! 
    case('rmin');             get_ixPar = ixPar%rmin              ! minimum stomatal resistance
    case('lai');              get_ixPar = ixPar%lai               ! monthly lai
    case('scf');              get_ixPar = ixPar%scf               ! 
    case('mfmax');            get_ixPar = ixPar%mfmax             ! 
    case('mfmin');            get_ixPar = ixPar%mfmin             ! 
    case('uadj');             get_ixPar = ixPar%uadj              ! 
    case('si');               get_ixPar = ixPar%si                ! 
    case('pxtemp');           get_ixPar = ixPar%pxtemp            ! 
    case('nmf');              get_ixPar = ixPar%nmf               ! 
    case('tipm');             get_ixPar = ixPar%tipm              ! 
    case('plwhc');            get_ixPar = ixPar%plwhc             ! 
    case('daygm');            get_ixPar = ixPar%daygm             ! 
    ! get to here if cannot find the variable
    case default;             get_ixPar = imiss
  endselect
 end function

! *******************************************************************************************************************
! function: get the index of the named variables for mapping data 
! *******************************************************************************************************************
 function get_ixDataMap(varName)
   USE var_lookup,only:ixVarMapData               ! indices of the named variables
   implicit none
   ! define dummy variables
   character(*), intent(in) :: varName            ! variable name
   integer(i4b)             :: get_ixDataMap      ! index of the named variable
   ! get the index of the named variables
   select case(trim(varName))
     case('hru_id');         get_ixDataMap = ixVarMapData%hru_id         ! hru ID 
     case('weight');         get_ixDataMap = ixVarMapData%weight         ! weight of overlapping polygon
     case('overlapPolyId');  get_ixDataMap = ixVarMapData%overlapPolyId  ! overlapping polygon ID 
     ! get to here if cannot find the variable
     case default;           get_ixDataMap = imiss
   end select
 end function

! *******************************************************************************************************************
! function: get the index of the named variables for veg data 
! *******************************************************************************************************************
 function get_ixDataVeg(varName)
   USE var_lookup,only:ixVarVegData               ! indices of the named variables
   implicit none
   ! define dummy variables
   character(*), intent(in) :: varName            ! variable name
   integer(i4b)             :: get_ixDataVeg      ! index of the named variable
   ! get the index of the named variables
   select case(trim(varName))
     case('polyid');     get_ixDataVeg = ixVarVegData%polyid     ! veg polygon ID 
     case('lai');        get_ixDataVeg = ixVarVegData%lai        ! monthly lai [m2 m-2] 
     case('grnfrc');     get_ixDataVeg = ixVarVegData%grnfrc     ! monthly greeness fraction [-] 
     case('vegclass');   get_ixDataVeg = ixVarVegData%vegclass   ! veg class in veg polygon and layer
     ! get to here if cannot find the variable
     case default;     get_ixDataVeg = imiss
   endselect
 end function

! *******************************************************************************************************************
! function: get the index of the named variables for soil data 
! *******************************************************************************************************************
 function get_ixDataSoil(varName)
  USE var_lookup,only:ixVarSoilData                 ! indices of the named variables
  implicit none
  ! define dummy variables
  character(*), intent(in) :: varName            ! variable name
  integer(i4b)             :: get_ixDataSoil     ! index of the named variable
  ! get the index of the named variables
  select case(trim(varName))
   case('polyid');       get_ixDataSoil = ixVarSoilData%polyid        ! soil polygon ID 
   case('hslyrs');       get_ixDataSoil = ixVarSoilData%hslyrs        ! soil layer thickness [m] 
   case('soilclass');    get_ixDataSoil = ixVarSoilData%soilclass     ! soil class in soil polygon and layer
   case('sand_frc');     get_ixDataSoil = ixVarSoilData%sand_frc      ! sand fraction in soil polygon and layer [-]
   case('silt_frc');     get_ixDataSoil = ixVarSoilData%silt_frc      ! silt fraction in soil polygon and layer [-]
   case('clay_frc');     get_ixDataSoil = ixVarSoilData%clay_frc      ! clay fraction in soil polygon and layer [-]
   case('bulk_density'); get_ixDataSoil = ixVarSoilData%bulk_density  ! bulk density in soil polygon and layer [-]
   case('ele_mean');     get_ixDataSoil = ixVarSoilData%ele_mean      ! average elev over soil polygon [m]
   case('ele_std');      get_ixDataSoil = ixVarSoilData%ele_std       ! std elev over soil polygon [m]
   case('slp_mean');     get_ixDataSoil = ixVarSoilData%slp_mean      ! average slope over soil polygon [-]
   ! get to here if cannot find the variable
   case default;     get_ixdataSoil = imiss
  endselect
 end function

! *******************************************************************************************************************
! function: get the index of the named variables for vegetation properties 
! *******************************************************************************************************************
 function get_ixPrpVeg(varName)
  use var_lookup,only:ixPrpVeg                   ! indices of the named variables
  implicit none
  ! define dummy variables
  character(*), intent(in) :: varName            ! variable name
  integer(i4b)             :: get_ixPrpVeg       ! index of the named variable
  ! get the index of the named variables
  select case(trim(varName))
   case('lai');          get_ixPrpVeg = ixPrpVeg%lai
   case('vegtype');      get_ixPrpVeg = ixPrpVeg%vegtype
   case('nroot');        get_ixPrpVeg = ixPrpVeg%nroot
   case('snup');         get_ixPrpVeg = ixPrpVeg%snup
   case('rs');           get_ixPrpVeg = ixPrpVeg%rs
   case('mrs');          get_ixPrpVeg = ixPrpVeg%mrs
   case('leafDim');      get_ixPrpVeg = ixPrpVeg%leafDim
   case('can_top_h');    get_ixPrpVeg = ixPrpVeg%can_top_h
   case('can_bot_h');    get_ixPrpVeg = ixPrpVeg%can_bot_h
   case('c_veg');        get_ixPrpVeg = ixPrpVeg%c_veg
   case('maxMassVeg');   get_ixPrpVeg = ixPrpVeg%maxMassVeg
   ! get to here if cannot find the variable
   case default;         get_ixPrpVeg = imiss
  endselect
 end function

end module get_ixname
