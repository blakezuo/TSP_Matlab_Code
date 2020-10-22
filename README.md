# TSP_Matlab_Code
Source codes to solve TSP problem on 100K cities

# 运行方法
在命令行窗口运行main_tsp()开始

# 算法
使用遗传算法(GA)，在100K个城市上解决TSP问题:
	1.原始数据文件为mona-lisa100K.tsp;
	2.选择算子使用精英保留策略(25%)，根据适应度值做轮盘赌；
	3.未使用交叉算子，由于100K数据量太大，随机搜索效率不高
	4.使用2-opt优化，变异算子截取一段路线做reverse

# 运行结果
初始化只画所有点结果会是一张蒙娜丽莎的图，如果加上路径，路径不是最优时会遮住蒙娜丽莎。