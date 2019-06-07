barplot(res$eig[,2], names.arg = 1:nrow(res$eig))
drawn <-
c("Grant_WA", "Umatilla_OR", "Benton_WA", "Morrow_OR", "Walla Walla_WA", 
"Whitman_WA", "Franklin_WA", "Lincoln_WA", "Wallowa_OR", "Union_OR", 
"Adams_WA")
plot.PCA(res, select = drawn, axes = 1:2, choix = 'ind', invisible = 'quali', title = '', cex = cex)
drawn <-
c("Cold Wet Weather", "Heat", "Drought", "Frost", "Hail", "Freeze", 
"Fire", "Excess Moisture/Precip/Rain")
plot.PCA(res, select = drawn, axes = 1:2, choix = 'var', title = '', cex = cex)
res.hcpc = HCPC(res, nb.clust = -1, graph = FALSE)
drawn <-
c("Grant_WA", "Umatilla_OR", "Benton_WA", "Morrow_OR", "Walla Walla_WA", 
"Whitman_WA", "Franklin_WA", "Lincoln_WA", "Wallowa_OR", "Union_OR", 
"Adams_WA")
plot.HCPC(res.hcpc, choice = 'map', draw.tree = FALSE, select = drawn, title = '')
dimdesc(res, axes = 1:2)
res.hcpc$desc.var
