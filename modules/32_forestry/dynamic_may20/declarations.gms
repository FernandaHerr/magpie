scalars
 s32_yeardiff									  year diff forestry
 s32_shift                                        Number of 5-year age-classes corresponding to current time step length
 p32_max_aff_area                                 Maximum global afforestation area that is greater or equal the exogenous policy target (mio. ha)
;

parameters
 p32_aff_pol(t,j)                                   ndc forest stock (mio. ha)
 p32_aff_pol_timestep(t,j)                          ndc afforestation per time step (mio. ha)
 p32_aff_pot(t,j)                                   Potential afforestation area (mio. ha)
 p32_aff_togo(t)              		                  Remaining exogenous afforestation wrt to the maximum exogenous target over time (mio. ha)
 p32_carbon_density_ac(t,j,type32,ac,ag_pools)      Carbon density for ac and ag_pools (tC per ha)
 p32_carbon_density_ac_forestry(t_all,j,ac)         Above ground carbon density for age classes and carbon pools (tC per ha)
 p32_carbon_density_ac_marg(t_all,j,ac)             Marginal above ground carbon density for age classes and carbon pools (tC per ha)
 p32_land(t,j,type32,ac)                            Forestry land for each cell wood type and age class before and after optimization (mio. ha)
 pc32_land(j,type32,ac)                             Forestry land per forestry land type initialization of the optimization (mio. ha)
 pc32_yield_forestry_future(j)                      Cellular timber yield expected in the future (m3 per ha per year)
 p32_production_ratio_ext(t_ext,i)                  Fraction of demand coming from commercial plantations (1)
 p32_plant_ini_ac(j)                                Initialization of plantation area (mio. ha)
 pc32_production_ratio_future(i)                    Future Fraction of demand coming from commercial plantations (1)
 p32_IGR(t_all,j,ac)                                Instantaneous growth rate or periodic annual increment of forest growth (1)
 p32_rot_flg(t_all,j,ac)                            Identifier flag when calculating rotation length (1)
 p32_rot_ac(j)                                      Rotation length translated to age classes on cellular level (1)
 p32_rotation_regional(t,i)                         Regional average rotation length of plantations translated to age class equivalent for future (1)
 p32_rot_length_ac_eqivalent(t_all,j)               Cellular rotation length of plantations translated to age class equivalent for future (1)
 p32_rotation_cellular(t_all,j)                     Harvesting rotation length translated to age classes on cellular level (1)
 p32_rotation_cellular_estb(t_all,j)                Establishment rotation length translated to age classes on cellular level (1)
 p32_rotation_cellular_harvesting(t_all,j)          Harvesting rotation length of plantations translated to age class equivalent for future (1)
 p32_bef_ipcc(clcl)                                 Biomass expansion factors for plantations (1)
 p32_cdr_ac(t,j,ac)						                      Non-cumulative CDR from afforestation for each age-class depending on planning horizon (tC per ha)
 p32_management_factor(j,mgmt_type)                 Management factor used to upscale plantation yields as compared to natural forest yields (1)
 p32_regional_min(j)                                Inverse of management factor in plantations (1)
 p32_dampen_pre(ac,j)                               Pre calculation for dampening factors applied on management factors (1)
 p32_dampen_final(ac,j)                             Final calculation for dampening factors applied on management factors (1)
 p32_rotation_offset                                offset calc
 p32_land_start(j,type32,ac)                        Saving first value of starting land (mio. ha)
 p32_land_before(t,j,type32,ac)                     Saving time value of starting land (mio. ha)
 pc32_demand_forestry_future(i,kforestry)           Future forestry demand in current time step (tDM per yr)
 pc32_selfsuff_forestry_future(i,kforestry)         Future self sufficiency ratio in simulation step (1)
 p32_plant_prod_share(t_ext,i) 					 	          Share of overall production coming from plantations (1)
 pc32_plant_prod_share_future(i)                    Future Share of overall production coming from plantations in simulation step (1)
 pc32_hvarea_forestry(j)                            Harvested area from plantations in current time step (mio. ha)
 p32_hv_area_current(t,i)                           Harvested area from plantations (mio. ha)
 p32_hv_area_past_avg(t,i)                          Average area harvested from plantations in past three time periods (mio. ha)
 p32_dummy_time(t)                                  Year difference between simulation time steps (yr)
 p32_dummy_elapsed(t)                               Elapsed time between simulation time step and two time steps in the past (yr)
 p32_replanting_cost                                Replanting costs (USD)
 p32_time(ac)                                       Time as a fucntion of age-classes (yr)
 p32_discount_factor(t_all,j,ac)                    Discount factor for each age class (1)
 p32_net_present_value(t_all,j,ac)                  Net present value for a representative 1ha land of plantations (mio. USD)
 p32_stand_value(t_all,j,ac)                        Stand value based on given prices (mio. USD)
 p32_investment_returns_lost(t_all,j,ac)            Present value of investment returns lost by not harvesting now and beginning a new series of rotations on the land (mio. USD)
 p32_land_rent_weighted(t_all,j,ac)                 Land rent weighted by the value of the trees at harvest age-class (mio. USD)
 p32_rot_flg_faustmann(t_all,j,ac)                  Identifier flag when calculating faustmann rotation length (1)
 p32_rot_length_faustmann(t_all,j)                  Cellular Faustmann rotation length of plantations translated to age class equivalent (1)
 p32_ncells(i)                                      Number of cells in each region (1)
 p32_representative_rotation(t_all,i)               representative regional rotation (1)
;

positive variables
 vm_cost_fore(i)                                    Forestry costs (Mio USD)
 v32_land(j,type32,ac)                              Forestry land pools (mio. ha)
 vm_landdiff_forestry                               Aggregated difference in forestry land compared to previous timestep (mio. ha)
 vm_cdr_aff(j,ac)                                   Total CDR from afforestation (new and existing areas) between t+1 and t=s32_planing_horizon (Tg CO2-C)
 v32_cost_recur(i)                                  Recurring forest management costs (USD per ha)
 vm_forestry_reduction(j,type32,ac_sub)             Area harvested for timber production (mio. ha)
 v32_land_expansion(j,type32,ac)                    Land expansion (mio. ha)
 v32_land_reduction(j,type32,ac)                    land reduction (mio. ha)
 v32_cost_establishment(i)                          Cost of establishment calculated at the current time step (mio. USD)
 ;

equations
 q32_cost_total(i)                                total forestry costs constraint (mio. USD)
 q32_land(j)                                      land constraint (mio. ha)
 q32_cdr_aff(j,ac)                                   calculation of CDR from afforestation
 q32_carbon(j,ag_pools)                            forestry carbon stock calculation
 q32_land_diff                                         aggregated difference in forestry land compared to previous timestep (mio. ha)
 q32_max_aff                                      maximum total global afforestation
 q32_aff_pol(j)                                   afforestation policy constraint
 q32_aff_ac0(j)							  Afforestation constraint for ac0 (mio. ha)
 q32_forestry_reduction(j,type32,ac_sub)             Harvested area from plantations (mio. ha)
 q32_cost_recur(i)                                Recurruing costs (mio. USD)
 q32_establishment_glo                               Establishment in current time step for future demand (mio. ha)
 q32_establishment_reg(i)                               Establishment in current time step for future demand (mio. ha)
 q32_land_expansion(j,type32,ac)                  Land expansion (mio. ha)
 q32_land_reduction(j,type32,ac)                  Land contarction (mio. ha)
 q32_cost_establishment(i)                        Present value of cost of establishment (mio. USD)
;


*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_fore(t,i,type)                          Forestry costs (Mio USD)
 ov32_land(t,j,type32,ac,type)                   Forestry land pools (mio. ha)
 ov_landdiff_forestry(t,type)                    Aggregated difference in forestry land compared to previous timestep (mio. ha)
 ov_cdr_aff(t,j,ac,type)                         Total CDR from afforestation (new and existing areas) between t+1 and t=s32_planing_horizon (Tg CO2-C)
 ov32_cost_recur(t,i,type)                       Recurring forest management costs (USD per ha)
 ov_forestry_reduction(t,j,type32,ac_sub,type)   Area harvested for timber production (mio. ha)
 ov32_land_expansion(t,j,type32,ac,type)         Land expansion (mio. ha)
 ov32_land_reduction(t,j,type32,ac,type)         land reduction (mio. ha)
 ov32_cost_establishment(t,i,type)               Cost of establishment calculated at the current time step (mio. USD)
 oq32_cost_total(t,i,type)                       total forestry costs constraint (mio. USD)
 oq32_land(t,j,type)                             land constraint (mio. ha)
 oq32_cdr_aff(t,j,ac,type)                       calculation of CDR from afforestation
 oq32_carbon(t,j,ag_pools,type)                  forestry carbon stock calculation
 oq32_land_diff(t,type)                          aggregated difference in forestry land compared to previous timestep (mio. ha)
 oq32_max_aff(t,type)                            maximum total global afforestation
 oq32_aff_pol(t,j,type)                          afforestation policy constraint
 oq32_aff_ac0(t,j,type)                          Afforestation constraint for ac0 (mio. ha)
 oq32_forestry_reduction(t,j,type32,ac_sub,type) Harvested area from plantations (mio. ha)
 oq32_cost_recur(t,i,type)                       Recurruing costs (mio. USD)
 oq32_establishment_glo(t,type)                  Establishment in current time step for future demand (mio. ha)
 oq32_establishment_reg(t,i,type)                Establishment in current time step for future demand (mio. ha)
 oq32_land_expansion(t,j,type32,ac,type)         Land expansion (mio. ha)
 oq32_land_reduction(t,j,type32,ac,type)         Land contarction (mio. ha)
 oq32_cost_establishment(t,i,type)               Present value of cost of establishment (mio. USD)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
