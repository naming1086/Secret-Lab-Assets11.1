//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Colors_BleachBypass" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 54158
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
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	float _Value;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.x = dot(vec3(0.25, 0.649999976, 0.100000001), u_xlat0.xyz);
    u_xlat4.x = (-u_xlat1.x) + 1.0;
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xxx) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = u_xlat1.x + -0.449999988;
    u_xlat1.x = u_xlat1.x * 10.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4.xyz = (-u_xlat2.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat10 = (-_Value) * u_xlat0.w + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat10);
    u_xlat10 = u_xlat0.w * _Value;
    SV_Target0.w = u_xlat0.w;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat1.xyz + u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                              OpDecorate %88 Location 88 
                                              OpDecorate %89 Location 89 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                        Output f32_4* %88 = OpVariable Output 
                         Input f32_4* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore vs_TEXCOORD0 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                                f32_4 %90 = OpLoad %89 
                                              OpStore %88 %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %78 %28 %74 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 157
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %142 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 DescriptorSet 36 
                                             OpDecorate %36 Binding 36 
                                             OpDecorate %142 Location 142 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %14 = OpTypeStruct %6 %7 
                                     %15 = OpTypePointer Uniform %14 
       Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 1 
                                     %19 = OpTypePointer Uniform %7 
                                     %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %31 = OpTypePointer UniformConstant %30 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampler 
                                     %35 = OpTypePointer UniformConstant %34 
            UniformConstant sampler* %36 = OpVariable UniformConstant 
                                     %38 = OpTypeSampledImage %30 
                                     %43 = OpTypeVector %6 3 
                                     %44 = OpTypePointer Private %43 
                      Private f32_3* %45 = OpVariable Private 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                               f32_3 %49 = OpConstantComposite %46 %47 %48 
                                     %53 = OpTypeInt 32 0 
                                 u32 %54 = OpConstant 0 
                                     %55 = OpTypePointer Private %6 
                      Private f32_3* %57 = OpVariable Private 
                                 f32 %61 = OpConstant 3.674022E-40 
                      Private f32_3* %70 = OpVariable Private 
                               f32_3 %74 = OpConstantComposite %61 %61 %61 
                                 f32 %89 = OpConstant 3.674022E-40 
                                 f32 %94 = OpConstant 3.674022E-40 
                                 f32 %99 = OpConstant 3.674022E-40 
                                f32 %104 = OpConstant 3.674022E-40 
                              f32_3 %105 = OpConstantComposite %104 %104 %104 
                       Private f32* %118 = OpVariable Private 
                                i32 %119 = OpConstant 0 
                                    %120 = OpTypePointer Uniform %6 
                                u32 %124 = OpConstant 3 
                                    %141 = OpTypePointer Output %7 
                      Output f32_4* %142 = OpVariable Output 
                                    %145 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %20 = OpAccessChain %16 %18 
                               f32_4 %21 = OpLoad %20 
                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                               f32_2 %23 = OpFMul %13 %22 
                      Uniform f32_4* %24 = OpAccessChain %16 %18 
                               f32_4 %25 = OpLoad %24 
                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                               f32_2 %27 = OpFAdd %23 %26 
                               f32_4 %28 = OpLoad %9 
                               f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %37 = OpLoad %36 
          read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                               f32_4 %40 = OpLoad %9 
                               f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                                             OpStore %9 %42 
                               f32_4 %50 = OpLoad %9 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                 f32 %52 = OpDot %49 %51 
                        Private f32* %56 = OpAccessChain %45 %54 
                                             OpStore %56 %52 
                        Private f32* %58 = OpAccessChain %45 %54 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFNegate %59 
                                 f32 %62 = OpFAdd %60 %61 
                        Private f32* %63 = OpAccessChain %57 %54 
                                             OpStore %63 %62 
                        Private f32* %64 = OpAccessChain %57 %54 
                                 f32 %65 = OpLoad %64 
                        Private f32* %66 = OpAccessChain %57 %54 
                                 f32 %67 = OpLoad %66 
                                 f32 %68 = OpFAdd %65 %67 
                        Private f32* %69 = OpAccessChain %57 %54 
                                             OpStore %69 %68 
                               f32_4 %71 = OpLoad %9 
                               f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                               f32_3 %73 = OpFNegate %72 
                               f32_3 %75 = OpFAdd %73 %74 
                                             OpStore %70 %75 
                               f32_3 %76 = OpLoad %57 
                               f32_3 %77 = OpVectorShuffle %76 %76 0 0 0 
                               f32_3 %78 = OpFNegate %77 
                               f32_3 %79 = OpLoad %70 
                               f32_3 %80 = OpFMul %78 %79 
                               f32_3 %81 = OpFAdd %80 %74 
                                             OpStore %57 %81 
                               f32_4 %82 = OpLoad %9 
                               f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                               f32_3 %84 = OpLoad %45 
                               f32_3 %85 = OpVectorShuffle %84 %84 0 0 0 
                               f32_3 %86 = OpFMul %83 %85 
                                             OpStore %70 %86 
                        Private f32* %87 = OpAccessChain %45 %54 
                                 f32 %88 = OpLoad %87 
                                 f32 %90 = OpFAdd %88 %89 
                        Private f32* %91 = OpAccessChain %45 %54 
                                             OpStore %91 %90 
                        Private f32* %92 = OpAccessChain %45 %54 
                                 f32 %93 = OpLoad %92 
                                 f32 %95 = OpFMul %93 %94 
                        Private f32* %96 = OpAccessChain %45 %54 
                                             OpStore %96 %95 
                        Private f32* %97 = OpAccessChain %45 %54 
                                 f32 %98 = OpLoad %97 
                                f32 %100 = OpExtInst %1 43 %98 %99 %61 
                       Private f32* %101 = OpAccessChain %45 %54 
                                             OpStore %101 %100 
                              f32_3 %102 = OpLoad %70 
                              f32_3 %103 = OpFNegate %102 
                              f32_3 %106 = OpFMul %103 %105 
                              f32_3 %107 = OpLoad %57 
                              f32_3 %108 = OpFAdd %106 %107 
                                             OpStore %57 %108 
                              f32_3 %109 = OpLoad %70 
                              f32_3 %110 = OpLoad %70 
                              f32_3 %111 = OpFAdd %109 %110 
                                             OpStore %70 %111 
                              f32_3 %112 = OpLoad %45 
                              f32_3 %113 = OpVectorShuffle %112 %112 0 0 0 
                              f32_3 %114 = OpLoad %57 
                              f32_3 %115 = OpFMul %113 %114 
                              f32_3 %116 = OpLoad %70 
                              f32_3 %117 = OpFAdd %115 %116 
                                             OpStore %45 %117 
                       Uniform f32* %121 = OpAccessChain %16 %119 
                                f32 %122 = OpLoad %121 
                                f32 %123 = OpFNegate %122 
                       Private f32* %125 = OpAccessChain %9 %124 
                                f32 %126 = OpLoad %125 
                                f32 %127 = OpFMul %123 %126 
                                f32 %128 = OpFAdd %127 %61 
                                             OpStore %118 %128 
                              f32_4 %129 = OpLoad %9 
                              f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                f32 %131 = OpLoad %118 
                              f32_3 %132 = OpCompositeConstruct %131 %131 %131 
                              f32_3 %133 = OpFMul %130 %132 
                              f32_4 %134 = OpLoad %9 
                              f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                             OpStore %9 %135 
                       Private f32* %136 = OpAccessChain %9 %124 
                                f32 %137 = OpLoad %136 
                       Uniform f32* %138 = OpAccessChain %16 %119 
                                f32 %139 = OpLoad %138 
                                f32 %140 = OpFMul %137 %139 
                                             OpStore %118 %140 
                       Private f32* %143 = OpAccessChain %9 %124 
                                f32 %144 = OpLoad %143 
                        Output f32* %146 = OpAccessChain %142 %124 
                                             OpStore %146 %144 
                                f32 %147 = OpLoad %118 
                              f32_3 %148 = OpCompositeConstruct %147 %147 %147 
                              f32_3 %149 = OpLoad %45 
                              f32_3 %150 = OpFMul %148 %149 
                              f32_4 %151 = OpLoad %9 
                              f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              f32_3 %153 = OpFAdd %150 %152 
                              f32_4 %154 = OpLoad %142 
                              f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                             OpStore %142 %155 
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