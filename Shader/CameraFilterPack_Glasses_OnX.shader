//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Glasses_OnX" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 52411
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
 vec4 phase0_Output0_0;
out vec2 vs_TEXCOORD1;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    phase0_Output0_0 = in_TEXCOORD0.xyxy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_0.xy;
vs_TEXCOORD1 = phase0_Output0_0.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _TimeX;
uniform 	float Fade;
uniform 	float VisionBlur;
uniform 	float GlassDistortion;
uniform 	float GlassAberration;
uniform 	vec4 GlassesColor;
uniform 	vec4 GlassesColor2;
uniform 	vec4 GlassColor;
uniform 	float UseFinalGlassColor;
uniform 	float UseScanLine;
uniform 	float UseScanLineSize;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
float u_xlat11;
vec3 u_xlat12;
float u_xlat16;
ivec2 u_xlati16;
vec2 u_xlat19;
vec2 u_xlat22;
float u_xlat23;
int u_xlati23;
float u_xlat30;
ivec2 u_xlati30;
float u_xlat33;
float u_xlat35;
bool u_xlatb35;
float u_xlat38;
bool u_xlatb38;
vec4 TempArray0[6];
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat22.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = (-Fade) + 1.0;
    u_xlat2.xy = u_xlat22.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat22.x = Fade + -0.699999988;
    u_xlat0.z = u_xlat22.x * 3.33333325;
    u_xlat0.z = clamp(u_xlat0.z, 0.0, 1.0);
    u_xlat33 = u_xlat0.z * -2.0 + 3.0;
    u_xlat12.xyz = vec3(Fade, Fade, _TimeX) * vec3(3.33333325, 5.0, 3.5);
    u_xlat12.xy = u_xlat12.xy;
    u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat12.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat12.xy = u_xlat12.xy * u_xlat12.xy;
    u_xlat12.x = u_xlat12.x * u_xlat3.x;
    u_xlat23 = (-u_xlat3.y) * u_xlat12.y + u_xlat2.y;
    u_xlat2.z = min(u_xlat23, 0.0);
    u_xlat2 = texture(_MainTex2, u_xlat2.xz);
    u_xlat3 = (-GlassesColor) + GlassesColor2;
    u_xlat3 = u_xlat2.yyyy * u_xlat3 + GlassesColor;
    u_xlat23 = (-u_xlat2.x) + u_xlat2.y;
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat23 = u_xlat23 + -0.5;
    u_xlat23 = u_xlat23 * GlassDistortion;
    u_xlat4.xy = (-vec2(u_xlat23)) * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
    u_xlat4 = texture(_MainTex, u_xlat4.xy);
    u_xlat35 = Fade * GlassAberration;
    u_xlat4.x = (-u_xlat35) * 0.25 + 0.200000003;
    u_xlat4.xz = (-vec2(u_xlat23)) * u_xlat4.xx + u_xlat0.xy;
    u_xlat5 = texture(_MainTex, u_xlat4.xz);
    u_xlat35 = u_xlat35 * 0.25 + 0.200000003;
    u_xlat4.xz = (-vec2(u_xlat23)) * vec2(u_xlat35) + u_xlat0.xy;
    u_xlat6 = texture(_MainTex, u_xlat4.xz);
    u_xlat7 = texture(_MainTex, u_xlat0.xy);
    TempArray0[5].x = 0.0;
    TempArray0[2].x = 0.400000006;
    TempArray0[1].x = 0.400000006;
    TempArray0[3].x = 0.400000006;
    TempArray0[0].x = 0.400000006;
    TempArray0[4].x = 0.400000006;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(0.0);
    u_xlat4.w = float(0.0);
    u_xlati23 = int(0xFFFFFFFEu);
    while(true){
        u_xlatb35 = 2<u_xlati23;
        if(u_xlatb35){break;}
        u_xlati16.xy = ivec2(u_xlati23) + ivec2(2, 1);
        u_xlat35 = TempArray0[u_xlati16.x].x;
        u_xlat16 = float(u_xlati23);
        u_xlat8.x = u_xlat16 * VisionBlur;
        u_xlat9.xyz = u_xlat4.xzw;
        u_xlati16.x = int(0xFFFFFFFEu);
        while(true){
            u_xlatb38 = 2<u_xlati16.x;
            if(u_xlatb38){break;}
            u_xlati30.xy = u_xlati16.xx + ivec2(2, 1);
            u_xlat38 = TempArray0[u_xlati30.x].x;
            u_xlat38 = u_xlat35 * u_xlat38;
            u_xlat30 = float(u_xlati16.x);
            u_xlat8.y = u_xlat30 * VisionBlur;
            u_xlat19.xy = u_xlat0.xy + u_xlat8.xy;
            u_xlat10 = texture(_MainTex, u_xlat19.xy);
            u_xlat9.xyz = vec3(u_xlat38) * u_xlat10.xyz + u_xlat9.xyz;
            u_xlati16.x = u_xlati30.y;
        }
        u_xlat4.xzw = u_xlat9.xyz;
        u_xlati23 = u_xlati16.y;
    }
    u_xlat8.xyz = u_xlat4.xzw * vec3(0.25, 0.25, 0.25);
    u_xlat8.w = 1.0;
    u_xlat8 = (-vec4(vec4(Fade, Fade, Fade, Fade))) * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003) + u_xlat8;
    u_xlat0.x = u_xlat1.x * UseScanLineSize;
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0.x = u_xlat0.x * 1.5 + u_xlat12.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.70000005;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat6.x = u_xlat5.x;
    u_xlat6.y = u_xlat4.y;
    u_xlat6.w = 1.0;
    u_xlat4 = u_xlat6 * GlassColor;
    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
    u_xlat5 = u_xlat4 * u_xlat0.xxxx + (-u_xlat4);
    u_xlat4 = vec4(vec4(UseScanLine, UseScanLine, UseScanLine, UseScanLine)) * u_xlat5 + u_xlat4;
    u_xlat5 = (-u_xlat4) + u_xlat8;
    u_xlat4 = u_xlat2.zzzz * u_xlat5 + u_xlat4;
    u_xlat0.x = u_xlat2.y + -0.100000001;
    u_xlat0.x = u_xlat0.x * 2.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz;
    u_xlat0.x = (-u_xlat11) * u_xlat0.x + 1.0;
    u_xlat3 = (-u_xlat0.xxxx) * vec4(0.800000012, 0.800000012, 0.800000012, 0.800000012) + u_xlat3;
    u_xlat3 = (-u_xlat4) + u_xlat3;
    u_xlat2 = u_xlat2.xxxx * u_xlat3 + u_xlat4;
    u_xlat2 = (-u_xlat8) + u_xlat2;
    u_xlat1 = u_xlat12.xxxx * u_xlat2 + u_xlat8;
    u_xlat2 = u_xlat7 * GlassColor + (-u_xlat7);
    u_xlat2 = vec4(UseFinalGlassColor) * u_xlat2 + u_xlat7;
    u_xlat0.x = (-u_xlat33) * u_xlat0.z + 1.0;
    u_xlat1 = u_xlat1 + (-u_xlat2);
    SV_Target0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %30 %58 %109 %119 %120 %123 %126 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %13 ArrayStride 13 
                                                     OpDecorate %14 ArrayStride 14 
                                                     OpMemberDecorate %16 0 Offset 16 
                                                     OpMemberDecorate %16 1 Offset 16 
                                                     OpMemberDecorate %16 2 Offset 16 
                                                     OpDecorate %16 Block 
                                                     OpDecorate %18 DescriptorSet 18 
                                                     OpDecorate %18 Binding 18 
                                                     OpDecorate %30 Location 30 
                                                     OpDecorate %58 Location 58 
                                                     OpMemberDecorate %107 0 BuiltIn 107 
                                                     OpMemberDecorate %107 1 BuiltIn 107 
                                                     OpMemberDecorate %107 2 BuiltIn 107 
                                                     OpDecorate %107 Block 
                                                     OpDecorate %119 Location 119 
                                                     OpDecorate %120 Location 120 
                                                     OpDecorate vs_TEXCOORD0 Location 123 
                                                     OpDecorate vs_TEXCOORD1 Location 126 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeBool 
                                              %7 = OpTypePointer Private %6 
                                Private bool* %8 = OpVariable Private 
                                              %9 = OpTypeFloat 32 
                                             %10 = OpTypeVector %9 4 
                                             %11 = OpTypeInt 32 0 
                                         u32 %12 = OpConstant 4 
                                             %13 = OpTypeArray %10 %12 
                                             %14 = OpTypeArray %10 %12 
                                             %15 = OpTypeVector %9 2 
                                             %16 = OpTypeStruct %13 %14 %15 
                                             %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_2;}* %18 = OpVariable Uniform 
                                             %19 = OpTypeInt 32 1 
                                         i32 %20 = OpConstant 2 
                                         u32 %21 = OpConstant 1 
                                             %22 = OpTypePointer Uniform %9 
                                         f32 %25 = OpConstant 3.674022E-40 
                                             %27 = OpTypePointer Private %9 
                                Private f32* %28 = OpVariable Private 
                                             %29 = OpTypePointer Input %15 
                                Input f32_2* %30 = OpVariable Input 
                                             %31 = OpTypePointer Input %9 
                                         f32 %35 = OpConstant 3.674022E-40 
                                             %37 = OpTypePointer Private %10 
                              Private f32_4* %38 = OpVariable Private 
                                             %40 = OpTypePointer Function %9 
                                         u32 %49 = OpConstant 3 
                                             %51 = OpTypeVector %9 3 
                              Private f32_4* %56 = OpVariable Private 
                                             %57 = OpTypePointer Input %10 
                                Input f32_4* %58 = OpVariable Input 
                                         i32 %61 = OpConstant 0 
                                         i32 %62 = OpConstant 1 
                                             %63 = OpTypePointer Uniform %10 
                                         i32 %82 = OpConstant 3 
                              Private f32_4* %86 = OpVariable Private 
                                            %106 = OpTypeArray %9 %21 
                                            %107 = OpTypeStruct %10 %9 %106 
                                            %108 = OpTypePointer Output %107 
       Output struct {f32_4; f32; f32[1];}* %109 = OpVariable Output 
                                            %117 = OpTypePointer Output %10 
                              Output f32_4* %119 = OpVariable Output 
                               Input f32_4* %120 = OpVariable Input 
                                            %122 = OpTypePointer Output %15 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                            %129 = OpTypePointer Output %9 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %41 = OpVariable Function 
                                Uniform f32* %23 = OpAccessChain %18 %20 %21 
                                         f32 %24 = OpLoad %23 
                                        bool %26 = OpFOrdLessThan %24 %25 
                                                     OpStore %8 %26 
                                  Input f32* %32 = OpAccessChain %30 %21 
                                         f32 %33 = OpLoad %32 
                                         f32 %34 = OpFNegate %33 
                                         f32 %36 = OpFAdd %34 %35 
                                                     OpStore %28 %36 
                                        bool %39 = OpLoad %8 
                                                     OpSelectionMerge %43 None 
                                                     OpBranchConditional %39 %42 %45 
                                             %42 = OpLabel 
                                         f32 %44 = OpLoad %28 
                                                     OpStore %41 %44 
                                                     OpBranch %43 
                                             %45 = OpLabel 
                                  Input f32* %46 = OpAccessChain %30 %21 
                                         f32 %47 = OpLoad %46 
                                                     OpStore %41 %47 
                                                     OpBranch %43 
                                             %43 = OpLabel 
                                         f32 %48 = OpLoad %41 
                                Private f32* %50 = OpAccessChain %38 %49 
                                                     OpStore %50 %48 
                                       f32_2 %52 = OpLoad %30 
                                       f32_3 %53 = OpVectorShuffle %52 %52 0 1 0 
                                       f32_4 %54 = OpLoad %38 
                                       f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                                     OpStore %38 %55 
                                       f32_4 %59 = OpLoad %58 
                                       f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                              Uniform f32_4* %64 = OpAccessChain %18 %61 %62 
                                       f32_4 %65 = OpLoad %64 
                                       f32_4 %66 = OpFMul %60 %65 
                                                     OpStore %56 %66 
                              Uniform f32_4* %67 = OpAccessChain %18 %61 %61 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %58 
                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %56 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %56 %73 
                              Uniform f32_4* %74 = OpAccessChain %18 %61 %20 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %58 
                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %56 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %56 %80 
                                       f32_4 %81 = OpLoad %56 
                              Uniform f32_4* %83 = OpAccessChain %18 %61 %82 
                                       f32_4 %84 = OpLoad %83 
                                       f32_4 %85 = OpFAdd %81 %84 
                                                     OpStore %56 %85 
                                       f32_4 %87 = OpLoad %56 
                                       f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
                              Uniform f32_4* %89 = OpAccessChain %18 %62 %62 
                                       f32_4 %90 = OpLoad %89 
                                       f32_4 %91 = OpFMul %88 %90 
                                                     OpStore %86 %91 
                              Uniform f32_4* %92 = OpAccessChain %18 %62 %61 
                                       f32_4 %93 = OpLoad %92 
                                       f32_4 %94 = OpLoad %56 
                                       f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
                                       f32_4 %96 = OpFMul %93 %95 
                                       f32_4 %97 = OpLoad %86 
                                       f32_4 %98 = OpFAdd %96 %97 
                                                     OpStore %86 %98 
                              Uniform f32_4* %99 = OpAccessChain %18 %62 %20 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %56 
                                      f32_4 %102 = OpVectorShuffle %101 %101 2 2 2 2 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %86 
                                      f32_4 %105 = OpFAdd %103 %104 
                                                     OpStore %86 %105 
                             Uniform f32_4* %110 = OpAccessChain %18 %62 %82 
                                      f32_4 %111 = OpLoad %110 
                                      f32_4 %112 = OpLoad %56 
                                      f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                      f32_4 %114 = OpFMul %111 %113 
                                      f32_4 %115 = OpLoad %86 
                                      f32_4 %116 = OpFAdd %114 %115 
                              Output f32_4* %118 = OpAccessChain %109 %61 
                                                     OpStore %118 %116 
                                      f32_4 %121 = OpLoad %120 
                                                     OpStore %119 %121 
                                      f32_4 %124 = OpLoad %38 
                                      f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                                     OpStore vs_TEXCOORD0 %125 
                                      f32_4 %127 = OpLoad %38 
                                      f32_2 %128 = OpVectorShuffle %127 %127 2 3 
                                                     OpStore vs_TEXCOORD1 %128 
                                Output f32* %130 = OpAccessChain %109 %61 %21 
                                        f32 %131 = OpLoad %130 
                                        f32 %132 = OpFNegate %131 
                                Output f32* %133 = OpAccessChain %109 %61 %21 
                                                     OpStore %133 %132 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 611
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %603 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %149 DescriptorSet 149 
                                                      OpDecorate %149 Binding 149 
                                                      OpDecorate %201 DescriptorSet 201 
                                                      OpDecorate %201 Binding 201 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %603 Location 603 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %14 %14 %14 %6 %6 %6 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4; f32_4; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 11 
                                              %20 = OpTypePointer Uniform %14 
                                              %31 = OpTypePointer Private %10 
                               Private f32_2* %32 = OpVariable Private 
                                          f32 %34 = OpConstant 3.674022E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                                              %37 = OpTypePointer Private %14 
                               Private f32_4* %38 = OpVariable Private 
                                          i32 %39 = OpConstant 1 
                                              %40 = OpTypePointer Uniform %6 
                                          f32 %44 = OpConstant 3.674022E-40 
                                              %46 = OpTypeInt 32 0 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Private %6 
                               Private f32_4* %50 = OpVariable Private 
                                          f32 %55 = OpConstant 3.674022E-40 
                                        f32_2 %56 = OpConstantComposite %55 %55 
                                          f32 %62 = OpConstant 3.674022E-40 
                                          f32 %67 = OpConstant 3.674022E-40 
                                          u32 %69 = OpConstant 2 
                                          f32 %73 = OpConstant 3.674022E-40 
                                 Private f32* %76 = OpVariable Private 
                                          f32 %79 = OpConstant 3.674022E-40 
                                          f32 %81 = OpConstant 3.674022E-40 
                               Private f32_3* %83 = OpVariable Private 
                                          i32 %88 = OpConstant 0 
                                          f32 %92 = OpConstant 3.674022E-40 
                                          f32 %93 = OpConstant 3.674022E-40 
                                        f32_3 %94 = OpConstantComposite %67 %92 %93 
                              Private f32_4* %107 = OpVariable Private 
                                       f32_2 %110 = OpConstantComposite %79 %79 
                                       f32_2 %112 = OpConstantComposite %81 %81 
                                Private f32* %129 = OpVariable Private 
                                         u32 %130 = OpConstant 1 
                                             %143 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %144 = OpTypePointer UniformConstant %143 
        UniformConstant read_only Texture2D* %145 = OpVariable UniformConstant 
                                             %147 = OpTypeSampler 
                                             %148 = OpTypePointer UniformConstant %147 
                    UniformConstant sampler* %149 = OpVariable UniformConstant 
                                             %151 = OpTypeSampledImage %143 
                                         i32 %159 = OpConstant 5 
                                         i32 %163 = OpConstant 6 
                                         i32 %185 = OpConstant 3 
                              Private f32_4* %189 = OpVariable Private 
                                         f32 %193 = OpConstant 3.674022E-40 
                                       f32_2 %194 = OpConstantComposite %193 %193 
        UniformConstant read_only Texture2D* %201 = OpVariable UniformConstant 
                    UniformConstant sampler* %203 = OpVariable UniformConstant 
                                Private f32* %211 = OpVariable Private 
                                         i32 %214 = OpConstant 4 
                              Private f32_4* %218 = OpVariable Private 
                                         f32 %221 = OpConstant 3.674022E-40 
                                         u32 %272 = OpConstant 6 
                                             %273 = OpTypeArray %14 %272 
                                             %274 = OpTypePointer Private %273 
                           Private f32_4[6]* %275 = OpVariable Private 
                                         i32 %277 = OpConstant 2 
                                         f32 %278 = OpConstant 3.674022E-40 
                              Private f32_4* %284 = OpVariable Private 
                                             %288 = OpTypePointer Private %18 
                                Private i32* %289 = OpVariable Private 
                                         i32 %290 = OpConstant -2 
                                             %296 = OpTypeBool 
                                        bool %297 = OpConstantTrue 
                                             %298 = OpTypePointer Private %296 
                               Private bool* %299 = OpVariable Private 
                                             %306 = OpTypeVector %18 2 
                                             %307 = OpTypePointer Private %306 
                              Private i32_2* %308 = OpVariable Private 
                                       i32_2 %311 = OpConstantComposite %277 %39 
                                Private f32* %317 = OpVariable Private 
                              Private f32_2* %320 = OpVariable Private 
                              Private f32_4* %326 = OpVariable Private 
                                Private i32* %331 = OpVariable Private 
                               Private bool* %337 = OpVariable Private 
                              Private i32_2* %344 = OpVariable Private 
                                Private f32* %348 = OpVariable Private 
                              Private f32_3* %356 = OpVariable Private 
                                       f32_3 %398 = OpConstantComposite %221 %221 %221 
                                         u32 %402 = OpConstant 3 
                                       f32_4 %419 = OpConstantComposite %193 %193 %193 %193 
                                         i32 %425 = OpConstant 10 
                                         f32 %438 = OpConstant 3.674022E-40 
                                         f32 %450 = OpConstant 3.674022E-40 
                                         f32 %460 = OpConstant 3.674022E-40 
                                         i32 %469 = OpConstant 7 
                                         f32 %475 = OpConstant 3.674022E-40 
                                         i32 %486 = OpConstant 9 
                                         f32 %517 = OpConstant 3.674022E-40 
                                         f32 %522 = OpConstant 3.674022E-40 
                                Private f32* %529 = OpVariable Private 
                                         f32 %551 = OpConstant 3.674022E-40 
                                       f32_4 %552 = OpConstantComposite %551 %551 %551 %551 
                                         i32 %583 = OpConstant 8 
                                             %602 = OpTypePointer Output %14 
                               Output f32_4* %603 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFMul %13 %23 
                               Uniform f32_4* %25 = OpAccessChain %17 %19 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                        f32_2 %28 = OpFAdd %24 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_2 %33 = OpLoad vs_TEXCOORD0 
                                        f32_2 %36 = OpFAdd %33 %35 
                                                      OpStore %32 %36 
                                 Uniform f32* %41 = OpAccessChain %17 %39 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                 Private f32* %49 = OpAccessChain %38 %47 
                                                      OpStore %49 %45 
                                        f32_2 %51 = OpLoad %32 
                                        f32_4 %52 = OpLoad %38 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 0 
                                        f32_2 %54 = OpFMul %51 %53 
                                        f32_2 %57 = OpFAdd %54 %56 
                                        f32_4 %58 = OpLoad %50 
                                        f32_4 %59 = OpVectorShuffle %58 %57 4 5 2 3 
                                                      OpStore %50 %59 
                                 Uniform f32* %60 = OpAccessChain %17 %39 
                                          f32 %61 = OpLoad %60 
                                          f32 %63 = OpFAdd %61 %62 
                                 Private f32* %64 = OpAccessChain %32 %47 
                                                      OpStore %64 %63 
                                 Private f32* %65 = OpAccessChain %32 %47 
                                          f32 %66 = OpLoad %65 
                                          f32 %68 = OpFMul %66 %67 
                                 Private f32* %70 = OpAccessChain %9 %69 
                                                      OpStore %70 %68 
                                 Private f32* %71 = OpAccessChain %9 %69 
                                          f32 %72 = OpLoad %71 
                                          f32 %74 = OpExtInst %1 43 %72 %73 %44 
                                 Private f32* %75 = OpAccessChain %9 %69 
                                                      OpStore %75 %74 
                                 Private f32* %77 = OpAccessChain %9 %69 
                                          f32 %78 = OpLoad %77 
                                          f32 %80 = OpFMul %78 %79 
                                          f32 %82 = OpFAdd %80 %81 
                                                      OpStore %76 %82 
                                 Uniform f32* %84 = OpAccessChain %17 %39 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %17 %39 
                                          f32 %87 = OpLoad %86 
                                 Uniform f32* %89 = OpAccessChain %17 %88 
                                          f32 %90 = OpLoad %89 
                                        f32_3 %91 = OpCompositeConstruct %85 %87 %90 
                                        f32_3 %95 = OpFMul %91 %94 
                                                      OpStore %83 %95 
                                        f32_3 %96 = OpLoad %83 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                        f32_3 %98 = OpLoad %83 
                                        f32_3 %99 = OpVectorShuffle %98 %97 3 4 2 
                                                      OpStore %83 %99 
                                       f32_3 %100 = OpLoad %83 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpCompositeConstruct %73 %73 
                                       f32_2 %103 = OpCompositeConstruct %44 %44 
                                       f32_2 %104 = OpExtInst %1 43 %101 %102 %103 
                                       f32_3 %105 = OpLoad %83 
                                       f32_3 %106 = OpVectorShuffle %105 %104 3 4 2 
                                                      OpStore %83 %106 
                                       f32_3 %108 = OpLoad %83 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %111 = OpFMul %109 %110 
                                       f32_2 %113 = OpFAdd %111 %112 
                                       f32_4 %114 = OpLoad %107 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 2 3 
                                                      OpStore %107 %115 
                                       f32_3 %116 = OpLoad %83 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_3 %118 = OpLoad %83 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                       f32_2 %120 = OpFMul %117 %119 
                                       f32_3 %121 = OpLoad %83 
                                       f32_3 %122 = OpVectorShuffle %121 %120 3 4 2 
                                                      OpStore %83 %122 
                                Private f32* %123 = OpAccessChain %83 %47 
                                         f32 %124 = OpLoad %123 
                                Private f32* %125 = OpAccessChain %107 %47 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %124 %126 
                                Private f32* %128 = OpAccessChain %83 %47 
                                                      OpStore %128 %127 
                                Private f32* %131 = OpAccessChain %107 %130 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFNegate %132 
                                Private f32* %134 = OpAccessChain %83 %130 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFMul %133 %135 
                                Private f32* %137 = OpAccessChain %50 %130 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFAdd %136 %138 
                                                      OpStore %129 %139 
                                         f32 %140 = OpLoad %129 
                                         f32 %141 = OpExtInst %1 37 %140 %73 
                                Private f32* %142 = OpAccessChain %50 %69 
                                                      OpStore %142 %141 
                         read_only Texture2D %146 = OpLoad %145 
                                     sampler %150 = OpLoad %149 
                  read_only Texture2DSampled %152 = OpSampledImage %146 %150 
                                       f32_4 %153 = OpLoad %50 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 2 
                                       f32_4 %155 = OpImageSampleImplicitLod %152 %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_4 %157 = OpLoad %50 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %50 %158 
                              Uniform f32_4* %160 = OpAccessChain %17 %159 
                                       f32_4 %161 = OpLoad %160 
                                       f32_4 %162 = OpFNegate %161 
                              Uniform f32_4* %164 = OpAccessChain %17 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpFAdd %162 %165 
                                                      OpStore %107 %166 
                                       f32_4 %167 = OpLoad %50 
                                       f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                                       f32_4 %169 = OpLoad %107 
                                       f32_4 %170 = OpFMul %168 %169 
                              Uniform f32_4* %171 = OpAccessChain %17 %159 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpFAdd %170 %172 
                                                      OpStore %107 %173 
                                Private f32* %174 = OpAccessChain %50 %47 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                Private f32* %177 = OpAccessChain %50 %130 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                                      OpStore %129 %179 
                                         f32 %180 = OpLoad %129 
                                         f32 %181 = OpExtInst %1 43 %180 %73 %44 
                                                      OpStore %129 %181 
                                         f32 %182 = OpLoad %129 
                                         f32 %183 = OpFAdd %182 %34 
                                                      OpStore %129 %183 
                                         f32 %184 = OpLoad %129 
                                Uniform f32* %186 = OpAccessChain %17 %185 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFMul %184 %187 
                                                      OpStore %129 %188 
                                         f32 %190 = OpLoad %129 
                                       f32_2 %191 = OpCompositeConstruct %190 %190 
                                       f32_2 %192 = OpFNegate %191 
                                       f32_2 %195 = OpFMul %192 %194 
                                       f32_3 %196 = OpLoad %9 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_2 %198 = OpFAdd %195 %197 
                                       f32_4 %199 = OpLoad %189 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 2 3 
                                                      OpStore %189 %200 
                         read_only Texture2D %202 = OpLoad %201 
                                     sampler %204 = OpLoad %203 
                  read_only Texture2DSampled %205 = OpSampledImage %202 %204 
                                       f32_4 %206 = OpLoad %189 
                                       f32_2 %207 = OpVectorShuffle %206 %206 0 1 
                                       f32_4 %208 = OpImageSampleImplicitLod %205 %207 
                                         f32 %209 = OpCompositeExtract %208 1 
                                Private f32* %210 = OpAccessChain %189 %130 
                                                      OpStore %210 %209 
                                Uniform f32* %212 = OpAccessChain %17 %39 
                                         f32 %213 = OpLoad %212 
                                Uniform f32* %215 = OpAccessChain %17 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %213 %216 
                                                      OpStore %211 %217 
                                         f32 %219 = OpLoad %211 
                                         f32 %220 = OpFNegate %219 
                                         f32 %222 = OpFMul %220 %221 
                                         f32 %223 = OpFAdd %222 %193 
                                Private f32* %224 = OpAccessChain %218 %47 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %129 
                                       f32_2 %226 = OpCompositeConstruct %225 %225 
                                       f32_2 %227 = OpFNegate %226 
                                       f32_4 %228 = OpLoad %218 
                                       f32_2 %229 = OpVectorShuffle %228 %228 0 0 
                                       f32_2 %230 = OpFMul %227 %229 
                                       f32_3 %231 = OpLoad %9 
                                       f32_2 %232 = OpVectorShuffle %231 %231 0 1 
                                       f32_2 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %218 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 3 
                                                      OpStore %218 %235 
                         read_only Texture2D %236 = OpLoad %201 
                                     sampler %237 = OpLoad %203 
                  read_only Texture2DSampled %238 = OpSampledImage %236 %237 
                                       f32_4 %239 = OpLoad %218 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 1 
                                       f32_4 %241 = OpImageSampleImplicitLod %238 %240 
                                         f32 %242 = OpCompositeExtract %241 0 
                                Private f32* %243 = OpAccessChain %189 %47 
                                                      OpStore %243 %242 
                                         f32 %244 = OpLoad %211 
                                         f32 %245 = OpFMul %244 %221 
                                         f32 %246 = OpFAdd %245 %193 
                                                      OpStore %211 %246 
                                         f32 %247 = OpLoad %129 
                                       f32_2 %248 = OpCompositeConstruct %247 %247 
                                       f32_2 %249 = OpFNegate %248 
                                         f32 %250 = OpLoad %211 
                                       f32_2 %251 = OpCompositeConstruct %250 %250 
                                       f32_2 %252 = OpFMul %249 %251 
                                       f32_3 %253 = OpLoad %9 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                       f32_2 %255 = OpFAdd %252 %254 
                                       f32_4 %256 = OpLoad %218 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
                                                      OpStore %218 %257 
                         read_only Texture2D %258 = OpLoad %201 
                                     sampler %259 = OpLoad %203 
                  read_only Texture2DSampled %260 = OpSampledImage %258 %259 
                                       f32_4 %261 = OpLoad %218 
                                       f32_2 %262 = OpVectorShuffle %261 %261 0 1 
                                       f32_4 %263 = OpImageSampleImplicitLod %260 %262 
                                         f32 %264 = OpCompositeExtract %263 2 
                                Private f32* %265 = OpAccessChain %189 %69 
                                                      OpStore %265 %264 
                         read_only Texture2D %266 = OpLoad %201 
                                     sampler %267 = OpLoad %203 
                  read_only Texture2DSampled %268 = OpSampledImage %266 %267 
                                       f32_3 %269 = OpLoad %9 
                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
                                       f32_4 %271 = OpImageSampleImplicitLod %268 %270 
                                                      OpStore %218 %271 
                                Private f32* %276 = OpAccessChain %275 %159 %47 
                                                      OpStore %276 %73 
                                Private f32* %279 = OpAccessChain %275 %277 %47 
                                                      OpStore %279 %278 
                                Private f32* %280 = OpAccessChain %275 %39 %47 
                                                      OpStore %280 %278 
                                Private f32* %281 = OpAccessChain %275 %185 %47 
                                                      OpStore %281 %278 
                                Private f32* %282 = OpAccessChain %275 %88 %47 
                                                      OpStore %282 %278 
                                Private f32* %283 = OpAccessChain %275 %214 %47 
                                                      OpStore %283 %278 
                                Private f32* %285 = OpAccessChain %284 %47 
                                                      OpStore %285 %73 
                                Private f32* %286 = OpAccessChain %284 %130 
                                                      OpStore %286 %73 
                                Private f32* %287 = OpAccessChain %284 %69 
                                                      OpStore %287 %73 
                                                      OpStore %289 %290 
                                                      OpBranch %291 
                                             %291 = OpLabel 
                                                      OpLoopMerge %293 %294 None 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                                      OpBranchConditional %297 %292 %293 
                                             %292 = OpLabel 
                                         i32 %300 = OpLoad %289 
                                        bool %301 = OpSLessThan %277 %300 
                                                      OpStore %299 %301 
                                        bool %302 = OpLoad %299 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %302 %303 %304 
                                             %303 = OpLabel 
                                                      OpBranch %293 
                                             %304 = OpLabel 
                                         i32 %309 = OpLoad %289 
                                       i32_2 %310 = OpCompositeConstruct %309 %309 
                                       i32_2 %312 = OpIAdd %310 %311 
                                                      OpStore %308 %312 
                                Private i32* %313 = OpAccessChain %308 %47 
                                         i32 %314 = OpLoad %313 
                                Private f32* %315 = OpAccessChain %275 %314 %47 
                                         f32 %316 = OpLoad %315 
                                                      OpStore %211 %316 
                                         i32 %318 = OpLoad %289 
                                         f32 %319 = OpConvertSToF %318 
                                                      OpStore %317 %319 
                                         f32 %321 = OpLoad %317 
                                Uniform f32* %322 = OpAccessChain %17 %277 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFMul %321 %323 
                                Private f32* %325 = OpAccessChain %320 %47 
                                                      OpStore %325 %324 
                                       f32_4 %327 = OpLoad %284 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_4 %329 = OpLoad %326 
                                       f32_4 %330 = OpVectorShuffle %329 %328 4 1 5 6 
                                                      OpStore %326 %330 
                                                      OpStore %331 %290 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                                      OpLoopMerge %334 %335 None 
                                                      OpBranch %336 
                                             %336 = OpLabel 
                                                      OpBranchConditional %297 %333 %334 
                                             %333 = OpLabel 
                                         i32 %338 = OpLoad %331 
                                        bool %339 = OpSLessThan %277 %338 
                                                      OpStore %337 %339 
                                        bool %340 = OpLoad %337 
                                                      OpSelectionMerge %342 None 
                                                      OpBranchConditional %340 %341 %342 
                                             %341 = OpLabel 
                                                      OpBranch %334 
                                             %342 = OpLabel 
                                         i32 %345 = OpLoad %331 
                                       i32_2 %346 = OpCompositeConstruct %345 %345 
                                       i32_2 %347 = OpIAdd %346 %311 
                                                      OpStore %344 %347 
                                Private i32* %349 = OpAccessChain %344 %47 
                                         i32 %350 = OpLoad %349 
                                Private f32* %351 = OpAccessChain %275 %350 %47 
                                         f32 %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                         f32 %353 = OpLoad %211 
                                         f32 %354 = OpLoad %348 
                                         f32 %355 = OpFMul %353 %354 
                                                      OpStore %348 %355 
                                         i32 %357 = OpLoad %331 
                                         f32 %358 = OpConvertSToF %357 
                                Private f32* %359 = OpAccessChain %356 %47 
                                                      OpStore %359 %358 
                                Private f32* %360 = OpAccessChain %356 %47 
                                         f32 %361 = OpLoad %360 
                                Uniform f32* %362 = OpAccessChain %17 %277 
                                         f32 %363 = OpLoad %362 
                                         f32 %364 = OpFMul %361 %363 
                                Private f32* %365 = OpAccessChain %320 %130 
                                                      OpStore %365 %364 
                                       f32_3 %366 = OpLoad %9 
                                       f32_2 %367 = OpVectorShuffle %366 %366 0 1 
                                       f32_2 %368 = OpLoad %320 
                                       f32_2 %369 = OpFAdd %367 %368 
                                       f32_3 %370 = OpLoad %356 
                                       f32_3 %371 = OpVectorShuffle %370 %369 3 4 2 
                                                      OpStore %356 %371 
                         read_only Texture2D %372 = OpLoad %201 
                                     sampler %373 = OpLoad %203 
                  read_only Texture2DSampled %374 = OpSampledImage %372 %373 
                                       f32_3 %375 = OpLoad %356 
                                       f32_2 %376 = OpVectorShuffle %375 %375 0 1 
                                       f32_4 %377 = OpImageSampleImplicitLod %374 %376 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                                      OpStore %356 %378 
                                         f32 %379 = OpLoad %348 
                                       f32_3 %380 = OpCompositeConstruct %379 %379 %379 
                                       f32_3 %381 = OpLoad %356 
                                       f32_3 %382 = OpFMul %380 %381 
                                       f32_4 %383 = OpLoad %326 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 2 3 
                                       f32_3 %385 = OpFAdd %382 %384 
                                       f32_4 %386 = OpLoad %326 
                                       f32_4 %387 = OpVectorShuffle %386 %385 4 1 5 6 
                                                      OpStore %326 %387 
                                Private i32* %388 = OpAccessChain %344 %130 
                                         i32 %389 = OpLoad %388 
                                                      OpStore %331 %389 
                                                      OpBranch %335 
                                             %335 = OpLabel 
                                                      OpBranch %332 
                                             %334 = OpLabel 
                                       f32_4 %390 = OpLoad %326 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 2 3 
                                       f32_4 %392 = OpLoad %284 
                                       f32_4 %393 = OpVectorShuffle %392 %391 4 5 6 3 
                                                      OpStore %284 %393 
                                Private i32* %394 = OpAccessChain %308 %130 
                                         i32 %395 = OpLoad %394 
                                                      OpStore %289 %395 
                                                      OpBranch %294 
                                             %294 = OpLabel 
                                                      OpBranch %291 
                                             %293 = OpLabel 
                                       f32_4 %396 = OpLoad %284 
                                       f32_3 %397 = OpVectorShuffle %396 %396 0 1 2 
                                       f32_3 %399 = OpFMul %397 %398 
                                       f32_4 %400 = OpLoad %284 
                                       f32_4 %401 = OpVectorShuffle %400 %399 4 5 6 3 
                                                      OpStore %284 %401 
                                Private f32* %403 = OpAccessChain %284 %402 
                                                      OpStore %403 %44 
                                Uniform f32* %404 = OpAccessChain %17 %39 
                                         f32 %405 = OpLoad %404 
                                Uniform f32* %406 = OpAccessChain %17 %39 
                                         f32 %407 = OpLoad %406 
                                Uniform f32* %408 = OpAccessChain %17 %39 
                                         f32 %409 = OpLoad %408 
                                Uniform f32* %410 = OpAccessChain %17 %39 
                                         f32 %411 = OpLoad %410 
                                       f32_4 %412 = OpCompositeConstruct %405 %407 %409 %411 
                                         f32 %413 = OpCompositeExtract %412 0 
                                         f32 %414 = OpCompositeExtract %412 1 
                                         f32 %415 = OpCompositeExtract %412 2 
                                         f32 %416 = OpCompositeExtract %412 3 
                                       f32_4 %417 = OpCompositeConstruct %413 %414 %415 %416 
                                       f32_4 %418 = OpFNegate %417 
                                       f32_4 %420 = OpFMul %418 %419 
                                       f32_4 %421 = OpLoad %284 
                                       f32_4 %422 = OpFAdd %420 %421 
                                                      OpStore %284 %422 
                                Private f32* %423 = OpAccessChain %38 %47 
                                         f32 %424 = OpLoad %423 
                                Uniform f32* %426 = OpAccessChain %17 %425 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFMul %424 %427 
                                Private f32* %429 = OpAccessChain %9 %47 
                                                      OpStore %429 %428 
                                Private f32* %430 = OpAccessChain %9 %47 
                                         f32 %431 = OpLoad %430 
                                Private f32* %432 = OpAccessChain %9 %130 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFMul %431 %433 
                                Private f32* %435 = OpAccessChain %9 %47 
                                                      OpStore %435 %434 
                                Private f32* %436 = OpAccessChain %9 %47 
                                         f32 %437 = OpLoad %436 
                                         f32 %439 = OpFMul %437 %438 
                                Private f32* %440 = OpAccessChain %83 %69 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                Private f32* %443 = OpAccessChain %9 %47 
                                                      OpStore %443 %442 
                                Private f32* %444 = OpAccessChain %9 %47 
                                         f32 %445 = OpLoad %444 
                                         f32 %446 = OpExtInst %1 13 %445 
                                Private f32* %447 = OpAccessChain %9 %47 
                                                      OpStore %447 %446 
                                Private f32* %448 = OpAccessChain %9 %47 
                                         f32 %449 = OpLoad %448 
                                         f32 %451 = OpFMul %449 %450 
                                         f32 %452 = OpFAdd %451 %450 
                                Private f32* %453 = OpAccessChain %9 %47 
                                                      OpStore %453 %452 
                                Private f32* %454 = OpAccessChain %9 %47 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpExtInst %1 30 %455 
                                Private f32* %457 = OpAccessChain %9 %47 
                                                      OpStore %457 %456 
                                Private f32* %458 = OpAccessChain %9 %47 
                                         f32 %459 = OpLoad %458 
                                         f32 %461 = OpFMul %459 %460 
                                Private f32* %462 = OpAccessChain %9 %47 
                                                      OpStore %462 %461 
                                Private f32* %463 = OpAccessChain %9 %47 
                                         f32 %464 = OpLoad %463 
                                         f32 %465 = OpExtInst %1 29 %464 
                                Private f32* %466 = OpAccessChain %9 %47 
                                                      OpStore %466 %465 
                                Private f32* %467 = OpAccessChain %189 %402 
                                                      OpStore %467 %44 
                                       f32_4 %468 = OpLoad %189 
                              Uniform f32_4* %470 = OpAccessChain %17 %469 
                                       f32_4 %471 = OpLoad %470 
                                       f32_4 %472 = OpFMul %468 %471 
                                                      OpStore %189 %472 
                                Private f32* %473 = OpAccessChain %9 %47 
                                         f32 %474 = OpLoad %473 
                                         f32 %476 = OpFMul %474 %475 
                                         f32 %477 = OpFAdd %476 %278 
                                Private f32* %478 = OpAccessChain %9 %47 
                                                      OpStore %478 %477 
                                       f32_4 %479 = OpLoad %189 
                                       f32_3 %480 = OpLoad %9 
                                       f32_4 %481 = OpVectorShuffle %480 %480 0 0 0 0 
                                       f32_4 %482 = OpFMul %479 %481 
                                       f32_4 %483 = OpLoad %189 
                                       f32_4 %484 = OpFNegate %483 
                                       f32_4 %485 = OpFAdd %482 %484 
                                                      OpStore %326 %485 
                                Uniform f32* %487 = OpAccessChain %17 %486 
                                         f32 %488 = OpLoad %487 
                                Uniform f32* %489 = OpAccessChain %17 %486 
                                         f32 %490 = OpLoad %489 
                                Uniform f32* %491 = OpAccessChain %17 %486 
                                         f32 %492 = OpLoad %491 
                                Uniform f32* %493 = OpAccessChain %17 %486 
                                         f32 %494 = OpLoad %493 
                                       f32_4 %495 = OpCompositeConstruct %488 %490 %492 %494 
                                         f32 %496 = OpCompositeExtract %495 0 
                                         f32 %497 = OpCompositeExtract %495 1 
                                         f32 %498 = OpCompositeExtract %495 2 
                                         f32 %499 = OpCompositeExtract %495 3 
                                       f32_4 %500 = OpCompositeConstruct %496 %497 %498 %499 
                                       f32_4 %501 = OpLoad %326 
                                       f32_4 %502 = OpFMul %500 %501 
                                       f32_4 %503 = OpLoad %189 
                                       f32_4 %504 = OpFAdd %502 %503 
                                                      OpStore %189 %504 
                                       f32_4 %505 = OpLoad %189 
                                       f32_4 %506 = OpFNegate %505 
                                       f32_4 %507 = OpLoad %284 
                                       f32_4 %508 = OpFAdd %506 %507 
                                                      OpStore %326 %508 
                                       f32_4 %509 = OpLoad %50 
                                       f32_4 %510 = OpVectorShuffle %509 %509 2 2 2 2 
                                       f32_4 %511 = OpLoad %326 
                                       f32_4 %512 = OpFMul %510 %511 
                                       f32_4 %513 = OpLoad %189 
                                       f32_4 %514 = OpFAdd %512 %513 
                                                      OpStore %189 %514 
                                Private f32* %515 = OpAccessChain %50 %130 
                                         f32 %516 = OpLoad %515 
                                         f32 %518 = OpFAdd %516 %517 
                                Private f32* %519 = OpAccessChain %9 %47 
                                                      OpStore %519 %518 
                                Private f32* %520 = OpAccessChain %9 %47 
                                         f32 %521 = OpLoad %520 
                                         f32 %523 = OpFMul %521 %522 
                                Private f32* %524 = OpAccessChain %9 %47 
                                                      OpStore %524 %523 
                                Private f32* %525 = OpAccessChain %9 %47 
                                         f32 %526 = OpLoad %525 
                                         f32 %527 = OpExtInst %1 43 %526 %73 %44 
                                Private f32* %528 = OpAccessChain %9 %47 
                                                      OpStore %528 %527 
                                Private f32* %530 = OpAccessChain %9 %47 
                                         f32 %531 = OpLoad %530 
                                         f32 %532 = OpFMul %531 %79 
                                         f32 %533 = OpFAdd %532 %81 
                                                      OpStore %529 %533 
                                       f32_3 %534 = OpLoad %9 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 2 
                                       f32_3 %536 = OpLoad %9 
                                       f32_2 %537 = OpVectorShuffle %536 %536 0 2 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_3 %539 = OpLoad %9 
                                       f32_3 %540 = OpVectorShuffle %539 %538 3 1 4 
                                                      OpStore %9 %540 
                                         f32 %541 = OpLoad %529 
                                         f32 %542 = OpFNegate %541 
                                Private f32* %543 = OpAccessChain %9 %47 
                                         f32 %544 = OpLoad %543 
                                         f32 %545 = OpFMul %542 %544 
                                         f32 %546 = OpFAdd %545 %44 
                                Private f32* %547 = OpAccessChain %9 %47 
                                                      OpStore %547 %546 
                                       f32_3 %548 = OpLoad %9 
                                       f32_4 %549 = OpVectorShuffle %548 %548 0 0 0 0 
                                       f32_4 %550 = OpFNegate %549 
                                       f32_4 %553 = OpFMul %550 %552 
                                       f32_4 %554 = OpLoad %107 
                                       f32_4 %555 = OpFAdd %553 %554 
                                                      OpStore %107 %555 
                                       f32_4 %556 = OpLoad %189 
                                       f32_4 %557 = OpFNegate %556 
                                       f32_4 %558 = OpLoad %107 
                                       f32_4 %559 = OpFAdd %557 %558 
                                                      OpStore %107 %559 
                                       f32_4 %560 = OpLoad %50 
                                       f32_4 %561 = OpVectorShuffle %560 %560 0 0 0 0 
                                       f32_4 %562 = OpLoad %107 
                                       f32_4 %563 = OpFMul %561 %562 
                                       f32_4 %564 = OpLoad %189 
                                       f32_4 %565 = OpFAdd %563 %564 
                                                      OpStore %50 %565 
                                       f32_4 %566 = OpLoad %284 
                                       f32_4 %567 = OpFNegate %566 
                                       f32_4 %568 = OpLoad %50 
                                       f32_4 %569 = OpFAdd %567 %568 
                                                      OpStore %50 %569 
                                       f32_3 %570 = OpLoad %83 
                                       f32_4 %571 = OpVectorShuffle %570 %570 0 0 0 0 
                                       f32_4 %572 = OpLoad %50 
                                       f32_4 %573 = OpFMul %571 %572 
                                       f32_4 %574 = OpLoad %284 
                                       f32_4 %575 = OpFAdd %573 %574 
                                                      OpStore %38 %575 
                                       f32_4 %576 = OpLoad %218 
                              Uniform f32_4* %577 = OpAccessChain %17 %469 
                                       f32_4 %578 = OpLoad %577 
                                       f32_4 %579 = OpFMul %576 %578 
                                       f32_4 %580 = OpLoad %218 
                                       f32_4 %581 = OpFNegate %580 
                                       f32_4 %582 = OpFAdd %579 %581 
                                                      OpStore %50 %582 
                                Uniform f32* %584 = OpAccessChain %17 %583 
                                         f32 %585 = OpLoad %584 
                                       f32_4 %586 = OpCompositeConstruct %585 %585 %585 %585 
                                       f32_4 %587 = OpLoad %50 
                                       f32_4 %588 = OpFMul %586 %587 
                                       f32_4 %589 = OpLoad %218 
                                       f32_4 %590 = OpFAdd %588 %589 
                                                      OpStore %50 %590 
                                         f32 %591 = OpLoad %76 
                                         f32 %592 = OpFNegate %591 
                                Private f32* %593 = OpAccessChain %9 %69 
                                         f32 %594 = OpLoad %593 
                                         f32 %595 = OpFMul %592 %594 
                                         f32 %596 = OpFAdd %595 %44 
                                Private f32* %597 = OpAccessChain %9 %47 
                                                      OpStore %597 %596 
                                       f32_4 %598 = OpLoad %38 
                                       f32_4 %599 = OpLoad %50 
                                       f32_4 %600 = OpFNegate %599 
                                       f32_4 %601 = OpFAdd %598 %600 
                                                      OpStore %38 %601 
                                       f32_3 %604 = OpLoad %9 
                                       f32_4 %605 = OpVectorShuffle %604 %604 0 0 0 0 
                                       f32_4 %606 = OpLoad %38 
                                       f32_4 %607 = OpFMul %605 %606 
                                       f32_4 %608 = OpLoad %50 
                                       f32_4 %609 = OpFAdd %607 %608 
                                                      OpStore %603 %609 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}