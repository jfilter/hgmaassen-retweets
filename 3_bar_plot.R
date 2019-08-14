library(tidyverse)

df <- read_csv('data.csv')

df$name <- factor(df$name, levels = rev(df$name))

df <- head(df, 25)
# Basic barplot

p<-ggplot(data=df, aes(x=name, y=value)) +
  geom_bar(stat="identity", fill='#2b8cbe') + 
  geom_text(aes(label=scales::percent(value)), vjust=0.6, hjust=1, color="white",
            position = position_dodge(0.9), size=3) +
  scale_y_continuous(labels = scales::percent) +
  theme_classic() + 
  theme(axis.title=element_blank(), axis.line = element_blank(), axis.ticks=element_blank(), axis.text.x = element_blank(), axis.text.y=element_text(hjust = 0, color='white')) +
  theme(text=element_text(family="Lato", face="bold", size=12)) + 
  labs(title='Twitter-Accounts,', subtitle="die Hans-Georg Maaßen retweeten, reweeten auch...", caption="© Creative Commons: CC BY Johannes Filter")

p

# Horizontal bar plot
p + coord_flip()

ggsave('bar.svg')

