local settings = {
        partyList = {
            columnWidth =  105 ,
            columns =  3 ,
            rowHeight =  42 ,
            rows =  2 ,
            background = {
                enabled =  true ,
                imgBottom = {
                    color =  '#FFFFFFC0' ,
                    enabled =  true ,
                    path = 'assets/xiv/AllyBgBottom.png' ,
                    pos = {0,0},
                    size = {327,5},
                },
                imgMid = {
                    color =  '#FFFFFFC0' ,
                    enabled =  true ,
                    path = 'assets/xiv/AllyBgMid.png' ,
                    pos = {0,5},
                    size = {327,42},
                },
                imgTop = {
                    color =  '#FFFFFFC0' ,
                    enabled =  true ,
                    path = 'assets/xiv/AllyBgTop.png' ,
                    pos = {0,0},
                    size = {327,5},
                },
                pos = {-6,-6},
            },
            listItem = {
                enabled =  true ,
                hp = {
                    bar = {
                        animSpeed =  0.1 ,
                        enabled =  true ,
                        imgBar = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarHP.png' ,
                            pos = {4,0},
                            size = {56,64},
                        },
                        imgBg = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarBG.png' ,
                            pos = {0,0},
                            size = {64,64},
                        },
                        imgFg = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarFG.png' ,
                            pos = {0,0},
                            size = {64,64},
                        },
                        imgGlow = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarGlowHP.png' ,
                            pos = {4,0},
                            size = {8,64},
                        },
                        imgGlowSides = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarGlowSidesHP.png' ,
                            pos = {1,0},
                            size = {3,64},
                        },
                        pos = {0,0},
                    },
                    enabled =  true ,
                    hideOutsideZone =  true ,
                    hpOrangeColor =  '#F8BA80FF' ,
                    hpRedColor =  '#FC8182FF' ,
                    hpYellowColor =  '#F3F37CFF' ,
                    pos = {37,-12},
                    snapToRaster =  true ,
                    zOrder =  2 ,
                },
                mp = {
                    bar = {
                        animSpeed =  0.1 ,
                        enabled =  true ,
                        imgBar = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarMP.png' ,
                            pos = {4,0},
                            size = {56,64},
                        },
                        imgFg = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarFG.png' ,
                            pos = {0,0},
                            size = {64,64},
                        },
                        imgGlow = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarGlowMP.png' ,
                            pos = {4,0},
                            size = {8,64},
                        },
                        imgGlowSides = {
                            color =  '#FFFFFFFF' ,
                            enabled =  true ,
                            path = 'assets/xiv/AllyBarGlowSidesMP.png' ,
                            pos = {1,0},
                            size = {3,64},
                        },
                        pos = {0,0},
                    },
                    enabled =  true ,
                    hideOutsideZone =  true ,
                    hpOrangeColor =  '#F8BA80FF' ,
                    hpRedColor =  '#FC8182FF' ,
                    hpYellowColor =  '#F3F37CFF' ,
                    pos = {37,-12},
                    snapToRaster =  true ,
                    zOrder =  3 ,
                },
                jobIcon = {
                    colors = {
                        dd =  '#663535FF' ,
                        healer =  '#3B6529FF' ,
                        special =  '#FF9700FF' ,
                        support =  '#DAB200FF' ,
                        tank =  '#364597FF' ,
                    },
                    enabled =  true ,
                    imgBg = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = 'assets/jobIcons/bg.png' ,
                        pos = {0,0},
                        size = {36,36},
                    },
                    imgFrame = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = 'assets/jobIcons/frame.png' ,
                        pos = {0,0},
                        size = {36,36},
                    },
                    imgGradient = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = 'assets/jobIcons/gradient.png' ,
                        pos = {0,0},
                        size = {36,36},
                    },
                    imgHighlight = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = 'assets/jobIcons/highlight.png' ,
                        pos = {-13,-13},
                        size = {62,62},
                    },
                    imgIcon = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = '',
                        pos = {0,0},
                        size = {36,36},
                    },
                    path =  'assets/jobIcons/',
                    pos = {4,4},
                    scale = {0.9,0.9},
                    snapToRaster =  true ,
                    zOrder =  4 ,
                },
                leader = {
                    enabled =  true ,
                    imgAlliance = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = 'assets/xiv/AllianceLeader.png' ,
                        pos = {0,12},
                        size = {24,24},
                    },
                    imgParty = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = 'assets/xiv/Leader.png' ,
                        pos = {0,0},
                        size = {24,24},
                    },
                    imgQuarterMaster = {
                        color =  '#FFFFFFFF' ,
                        enabled =  true ,
                        path = 'assets/xiv/QuarterMaster.png' ,
                        pos = {0,24},
                        size = {24,24},
                    },
                    pos = {-6,0},
                    scale = {0.8,0.8},
                    zOrder =  5 ,
                },
                hover = {
                    color =  '#FFFFFFAA' ,
                    enabled =  true ,
                    path = 'assets/xiv/AllyHover.png' ,
                    pos = {-11,-8},
                    size = {125,55},
                    zOrder =  0 ,
                },
                cursor = {
                    color =  '#FFFFFFFF' ,
                    enabled =  true ,
                    path = 'assets/xiv/AllyCursor.png' ,
                    pos = {-6,-6},
                    size = {116,53},
                    zOrder =  1 ,
                },
                txtName = {
                    color =  '#F0FFFFFF' ,
                    enabled =  true ,
                    font = 'Arial',
                    pos = {41,1},
                    size =  8 ,
                    snapToRaster =  true ,
                    stroke =  '#062D54C8' ,
                    strokeWidth =  2 ,
                    maxChars =  9 ,
                    zOrder =  6 ,
                },
                txtZone = {
                    alignRight =  false ,
                    color =  '#F0FFFFFF' ,
                    enabled =  true ,
                    font = 'Arial',
                    pos = {8,18},
                    short =  true ,
                    size =  9 ,
                    snapToRaster =  true ,
                    stroke =  '#062D54C8' ,
                    strokeWidth =  2 ,
                    zOrder =  7 ,
                },
            },
        },
}
return settings;