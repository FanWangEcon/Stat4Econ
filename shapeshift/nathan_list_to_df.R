
library(tibble)
library(dplyr)

# Basic Unstacking, while looping over list
# Generating two variable dataframe based on two named lists of t and c
device_id = list(t = c('abc', 'efg'), c = c('efs', 'gjie', 'werj'))
df_1 <- data.frame(device_id$t, 1 + rep(0, length(device_id$t)))
colnames(df_1) <- c('devices', 't_c')
df_0 <- data.frame(device_id$c, 0 + rep(0, length(device_id$t)))
colnames(df_0) <- c('devices', 't_c')
rbind(df_0, df_1)


# Basic Unstacking, while looping over list
# Generating two variable dataframe based on two named lists of t and c
device_id = list(t = as.tibble(c('abc', 'efg')), c = as.tibble(c('efs', 'gjie', 'werj')))
df_1 <- data.frame(device_id$t, 1 + rep(0, length(device_id$t)))
colnames(df_1) <- c('devices', 't_c')
df_0 <- data.frame(device_id$c, 0 + rep(0, length(device_id$t)))
colnames(df_0) <- c('devices', 't_c')
rbind(df_0, df_1)


# TO help Nathan see more summary stats etc
# we want dataframe with three variables: deviceid, t_c, ad_id
ads_device_id = list(list(t = as.tibble(c('abc1', 'efg')),
                          c = as.tibble(c('efs', 'gjie', 'werj'))),
                    list(t = as.tibble(c('gjie', 'gfg', 'efg', 'qwej')),
                         c = as.tibble(c('ewfs', 'adfgjie', 'erwerj', 'erwewer13'))))

gen_data_frame <- function(device_id_list){

  df_1 <- data.frame(device_id_list$t,
                     1 + rep(0, length(device_id_list$t)))
  colnames(df_1) <- c('devices', 't_c')

  df_0 <- data.frame(device_id$c,
                     0 + rep(0, length(device_id$t)))
  colnames(df_0) <- c('devices', 't_c')

  df_combo <- rbind(df_0, df_1)

  return(df_combo)
}


gen_data_frame(ads_device_id[[1]])
gen_data_frame(ads_device_id[[2]])

list_df <- lapply(ads_device_id, gen_data_frame)

nathan_is_happy_df <- bind_rows(list_df, .id = 'ad_id')

# Summary Statistics

# First: how many ads each device is exposed to
nathan_is_happy_df %>%
  group_by(devices) %>%
  mutate (ad_count = n())

nathan_is_happy_df %>%
  arrange(devices, ad_id) %>%
  group_by(devices) %>%
  mutate (ad_continuous = cumsum(t_c))

Z_county <- df %>%
  select(county_state, three_digit_zip)
  group_by(county_state, three_digit_zip) %>%
  top_n(row_number()==1)
