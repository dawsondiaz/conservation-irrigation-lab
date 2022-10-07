WIN_22_NDVI %>% # Select data from which to make plot from
  ggplot(aes(x=date, y=NDVI, group=site, color=site))+ #Sets X/Y axis, groups data by site, and gives color to those groups
  geom_point()+ #Plots data points
  geom_line()+ #Data points connected with lines
  labs(x="Date", y="NDVI", title="", color="Location")+ #Labels all axis and legend, optional title
  scale_color_grey()+ # Makes things B/W
  theme_classic()+ # Removes checkered/scaled background
  scale_y_continuous(limits=c(0,1))+ #Sets scale for Y axis
  theme(
    plot.margin = margin(1,1,1,1,"cm"), #Adjust margins of entire plot
    axis.title.x = element_text(margin = margin(.25,0,0,0,"cm")), #Adjusts X axis title
    axis.title.y = element_text(margin = margin(0,.25,0,0,"cm")), #Adjust Y axis title 
    text = element_text(family="Times",size=20)) #Set font and size of graph text
