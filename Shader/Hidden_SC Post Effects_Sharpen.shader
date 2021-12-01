//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Sharpen" {
Properties {
}
SubShader {
 Pass {
  Name "Sharpen"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 30516
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat8;
void main()
{
    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenParams.xy;
    u_xlat0.zw = (-u_xlat0.yx);
    u_xlat1 = u_xlat0.xzwy * _Params.yyyy + vs_TEXCOORD1.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat8.xy = (-u_xlat0.xy) * _Params.yy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy * _Params.yy + vs_TEXCOORD1.xy;
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat8.xy);
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.25, 0.25, 0.25) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * _Params.xxx + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 162
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %39 %142 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpMemberDecorate %13 0 Offset 13 
                                             OpMemberDecorate %13 1 Offset 13 
                                             OpDecorate %13 Block 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate vs_TEXCOORD1 Location 39 
                                             OpDecorate %48 DescriptorSet 48 
                                             OpDecorate %48 Binding 48 
                                             OpDecorate %52 DescriptorSet 52 
                                             OpDecorate %52 Binding 52 
                                             OpDecorate %142 Location 142 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                 f32 %11 = OpConstant 3.674022E-40 
                               f32_2 %12 = OpConstantComposite %11 %11 
                                     %13 = OpTypeStruct %7 %7 
                                     %14 = OpTypePointer Uniform %13 
     Uniform struct {f32_4; f32_4;}* %15 = OpVariable Uniform 
                                     %16 = OpTypeInt 32 1 
                                 i32 %17 = OpConstant 0 
                                     %18 = OpTypePointer Uniform %7 
                      Private f32_4* %30 = OpVariable Private 
                                 i32 %33 = OpConstant 1 
                                     %38 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %43 = OpTypeVector %6 3 
                                     %44 = OpTypePointer Private %43 
                      Private f32_3* %45 = OpVariable Private 
                                     %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %47 = OpTypePointer UniformConstant %46 
UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                     %50 = OpTypeSampler 
                                     %51 = OpTypePointer UniformConstant %50 
            UniformConstant sampler* %52 = OpVariable UniformConstant 
                                     %54 = OpTypeSampledImage %46 
                                     %69 = OpTypePointer Private %10 
                      Private f32_2* %70 = OpVariable Private 
                      Private f32_3* %90 = OpVariable Private 
                                f32 %133 = OpConstant 3.674022E-40 
                              f32_3 %134 = OpConstantComposite %133 %133 %133 
                                    %141 = OpTypePointer Output %7 
                      Output f32_4* %142 = OpVariable Output 
                                    %154 = OpTypeInt 32 0 
                                u32 %155 = OpConstant 3 
                                    %156 = OpTypePointer Private %6 
                                    %159 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %19 = OpAccessChain %15 %17 
                               f32_4 %20 = OpLoad %19 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                               f32_2 %22 = OpFDiv %12 %21 
                               f32_4 %23 = OpLoad %9 
                               f32_4 %24 = OpVectorShuffle %23 %22 4 5 2 3 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                               f32_2 %26 = OpVectorShuffle %25 %25 1 0 
                               f32_2 %27 = OpFNegate %26 
                               f32_4 %28 = OpLoad %9 
                               f32_4 %29 = OpVectorShuffle %28 %27 0 1 4 5 
                                             OpStore %9 %29 
                               f32_4 %31 = OpLoad %9 
                               f32_4 %32 = OpVectorShuffle %31 %31 0 2 3 1 
                      Uniform f32_4* %34 = OpAccessChain %15 %33 
                               f32_4 %35 = OpLoad %34 
                               f32_4 %36 = OpVectorShuffle %35 %35 1 1 1 1 
                               f32_4 %37 = OpFMul %32 %36 
                               f32_2 %40 = OpLoad vs_TEXCOORD1 
                               f32_4 %41 = OpVectorShuffle %40 %40 0 1 0 1 
                               f32_4 %42 = OpFAdd %37 %41 
                                             OpStore %30 %42 
                 read_only Texture2D %49 = OpLoad %48 
                             sampler %53 = OpLoad %52 
          read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                               f32_4 %56 = OpLoad %30 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                               f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                             OpStore %45 %59 
                 read_only Texture2D %60 = OpLoad %48 
                             sampler %61 = OpLoad %52 
          read_only Texture2DSampled %62 = OpSampledImage %60 %61 
                               f32_4 %63 = OpLoad %30 
                               f32_2 %64 = OpVectorShuffle %63 %63 2 3 
                               f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                               f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               f32_4 %67 = OpLoad %30 
                               f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                             OpStore %30 %68 
                               f32_4 %71 = OpLoad %9 
                               f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                               f32_2 %73 = OpFNegate %72 
                      Uniform f32_4* %74 = OpAccessChain %15 %33 
                               f32_4 %75 = OpLoad %74 
                               f32_2 %76 = OpVectorShuffle %75 %75 1 1 
                               f32_2 %77 = OpFMul %73 %76 
                               f32_2 %78 = OpLoad vs_TEXCOORD1 
                               f32_2 %79 = OpFAdd %77 %78 
                                             OpStore %70 %79 
                               f32_4 %80 = OpLoad %9 
                               f32_2 %81 = OpVectorShuffle %80 %80 0 1 
                      Uniform f32_4* %82 = OpAccessChain %15 %33 
                               f32_4 %83 = OpLoad %82 
                               f32_2 %84 = OpVectorShuffle %83 %83 1 1 
                               f32_2 %85 = OpFMul %81 %84 
                               f32_2 %86 = OpLoad vs_TEXCOORD1 
                               f32_2 %87 = OpFAdd %85 %86 
                               f32_4 %88 = OpLoad %9 
                               f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                             OpStore %9 %89 
                 read_only Texture2D %91 = OpLoad %48 
                             sampler %92 = OpLoad %52 
          read_only Texture2DSampled %93 = OpSampledImage %91 %92 
                               f32_4 %94 = OpLoad %9 
                               f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                               f32_4 %96 = OpImageSampleImplicitLod %93 %95 
                               f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                             OpStore %90 %97 
                 read_only Texture2D %98 = OpLoad %48 
                             sampler %99 = OpLoad %52 
         read_only Texture2DSampled %100 = OpSampledImage %98 %99 
                              f32_2 %101 = OpLoad %70 
                              f32_4 %102 = OpImageSampleImplicitLod %100 %101 
                              f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                              f32_4 %104 = OpLoad %9 
                              f32_4 %105 = OpVectorShuffle %104 %103 4 5 6 3 
                                             OpStore %9 %105 
                              f32_3 %106 = OpLoad %45 
                              f32_4 %107 = OpLoad %9 
                              f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                              f32_3 %109 = OpFAdd %106 %108 
                              f32_4 %110 = OpLoad %9 
                              f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                             OpStore %9 %111 
                              f32_4 %112 = OpLoad %30 
                              f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                              f32_4 %114 = OpLoad %9 
                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              f32_3 %116 = OpFAdd %113 %115 
                              f32_4 %117 = OpLoad %9 
                              f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                             OpStore %9 %118 
                              f32_3 %119 = OpLoad %90 
                              f32_4 %120 = OpLoad %9 
                              f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                              f32_3 %122 = OpFAdd %119 %121 
                              f32_4 %123 = OpLoad %9 
                              f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
                                             OpStore %9 %124 
                read_only Texture2D %125 = OpLoad %48 
                            sampler %126 = OpLoad %52 
         read_only Texture2DSampled %127 = OpSampledImage %125 %126 
                              f32_2 %128 = OpLoad vs_TEXCOORD1 
                              f32_4 %129 = OpImageSampleImplicitLod %127 %128 
                                             OpStore %30 %129 
                              f32_4 %130 = OpLoad %9 
                              f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              f32_3 %132 = OpFNegate %131 
                              f32_3 %135 = OpFMul %132 %134 
                              f32_4 %136 = OpLoad %30 
                              f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              f32_3 %138 = OpFAdd %135 %137 
                              f32_4 %139 = OpLoad %9 
                              f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                             OpStore %9 %140 
                              f32_4 %143 = OpLoad %9 
                              f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                     Uniform f32_4* %145 = OpAccessChain %15 %33 
                              f32_4 %146 = OpLoad %145 
                              f32_3 %147 = OpVectorShuffle %146 %146 0 0 0 
                              f32_3 %148 = OpFMul %144 %147 
                              f32_4 %149 = OpLoad %30 
                              f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              f32_3 %151 = OpFAdd %148 %150 
                              f32_4 %152 = OpLoad %142 
                              f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
                                             OpStore %142 %153 
                       Private f32* %157 = OpAccessChain %30 %155 
                                f32 %158 = OpLoad %157 
                        Output f32* %160 = OpAccessChain %142 %155 
                                             OpStore %160 %158 
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